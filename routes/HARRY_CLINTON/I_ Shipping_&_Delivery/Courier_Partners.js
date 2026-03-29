// routes/CourierPartners.js (HARRY_CLINTON) - BASIC CRUD (5 endpoints)

const express = require('express');
const router = express.Router();
const { pool, poolConnect, sql } = require('../../../config/db_harry_clinton');

/* =========================================
   FIELD TYPES
========================================= */
const FIELD_TYPES = {
  courier_partner_id: { type: sql.VarChar, maxLength: 36 },
  courier_name: { type: sql.VarChar, maxLength: 255 },
  courier_code: { type: sql.VarChar, maxLength: 50 },
  logo_url: { type: sql.VarChar, maxLength: 1000 },
  tracking_url: { type: sql.VarChar, maxLength: 1000 },

  contact_number: { type: sql.VarChar, maxLength: 50 },
  support_email: { type: sql.VarChar, maxLength: 255 },
  website_url: { type: sql.VarChar, maxLength: 500 },
  description: { type: sql.VarChar, maxLength: 500 },

  display_order: { type: sql.Int },

  isactive: { type: sql.Bit },
  isdeleted: { type: sql.Bit },

  rcu: { type: sql.VarChar, maxLength: 100 },
  rcm: { type: sql.DateTime },
  luu: { type: sql.VarChar, maxLength: 100 },
  lcm: { type: sql.DateTime }
};

const INSERT_FIELDS = [
  'courier_name',
  'courier_code',
  'logo_url',
  'tracking_url',
  'contact_number',
  'support_email',
  'website_url',
  'description',
  'display_order',
  'rcu'
];

const UPDATE_FIELDS = [
  'courier_name',
  'courier_code',
  'logo_url',
  'tracking_url',
  'contact_number',
  'support_email',
  'website_url',
  'description',
  'display_order',
  'isactive',
  'isdeleted',
  'luu'
];

/* =========================================
   INPUT PREPARATION
========================================= */
const prepareInputValue = (field, value) => {
  if (value === null || value === undefined || value === '') return null;

  const typeName = FIELD_TYPES[field]?.type?.name;

  if (typeName === 'Bit') {
    if (typeof value === 'boolean') return value;
    if (typeof value === 'number') return value ? 1 : 0;

    if (typeof value === 'string') {
      const v = value.trim().toLowerCase();
      if (['1', 'true', 'yes', 'y'].includes(v)) return 1;
      if (['0', 'false', 'no', 'n'].includes(v)) return 0;
    }
    return null;
  }

  if (field === 'display_order') {
    const num = parseInt(value, 10);
    return !isNaN(num) && num > 0 ? num : null;
  }

  return typeof value === 'string' ? value.trim() : value;
};

const IST_NOW_SQL = 'DATEADD(MINUTE, 330, GETUTCDATE())';

/* =========================================
   1) GET ALL
========================================= */
router.get('/', async (req, res) => {
  try {
    await poolConnect;

    const includeDeleted =
      req.query.includeDeleted === '1' ||
      req.query.includeDeleted === 'true';

    const includeInactive =
      req.query.includeInactive === '1' ||
      req.query.includeInactive === 'true';

    const where = [];
    if (!includeDeleted) where.push('isdeleted = 0');
    if (!includeInactive) where.push('isactive = 1');

    const query = `
      SELECT *
      FROM dbo.tbl_courier_partners
      ${where.length ? `WHERE ${where.join(' AND ')}` : ''}
      ORDER BY display_order ASC, rcm DESC;
    `;

    const result = await pool.request().query(query);

    res.json({
      success: true,
      data: result.recordset,
      count: result.recordset.length
    });
  } catch (err) {
    console.error('CourierPartners GET error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

/* =========================================
   2) GET BY ID
========================================= */
router.get('/:id', async (req, res) => {
  try {
    const id = req.params.id;

    if (!id) {
      return res
        .status(400)
        .json({ success: false, message: 'courier_partner_id required' });
    }

    await poolConnect;

    const request = pool
      .request()
      .input('courier_partner_id', FIELD_TYPES.courier_partner_id.type, id);

    const result = await request.query(`
      SELECT *
      FROM dbo.tbl_courier_partners
      WHERE courier_partner_id = @courier_partner_id
        AND isdeleted = 0;
    `);

    if (result.recordset.length === 0) {
      return res
        .status(404)
        .json({ success: false, message: 'Courier partner not found' });
    }

    res.json({ success: true, data: result.recordset[0] });
  } catch (err) {
    console.error('CourierPartners GET BY ID error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

/* =========================================
   3) POST (CREATE)
========================================= */
router.post('/', async (req, res) => {
  try {
    const data = req.body;

    if (!data.courier_name) {
      return res.status(400).json({
        success: false,
        message: 'courier_name required'
      });
    }

    if (data.display_order && parseInt(data.display_order, 10) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'display_order must be greater than 0'
      });
    }

    const cols = [];
    const vals = [];
    const request = pool.request();

    INSERT_FIELDS.forEach((f) => {
      if (data[f] != null) {
        const v = prepareInputValue(f, data[f]);
        if (v !== null) {
          cols.push(f);
          vals.push('@' + f);
          request.input(f, FIELD_TYPES[f].type, v);
        }
      }
    });

    await poolConnect;

    const result = await request.query(`
      INSERT INTO dbo.tbl_courier_partners (${cols.join(',')})
      OUTPUT INSERTED.*
      VALUES (${vals.join(',')});
    `);

    res.status(201).json({
      success: true,
      data: result.recordset[0]
    });
  } catch (err) {
    console.error('CourierPartners POST error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

/* =========================================
   4) PUT (UPDATE)
========================================= */
router.put('/', async (req, res) => {
  try {
    const data = req.body;

    if (!data.courier_partner_id) {
      return res.status(400).json({
        success: false,
        message: 'courier_partner_id required'
      });
    }

    if (data.display_order && parseInt(data.display_order, 10) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'display_order must be greater than 0'
      });
    }

    const updates = [];
    const request = pool.request();

    request.input(
      'courier_partner_id',
      FIELD_TYPES.courier_partner_id.type,
      data.courier_partner_id
    );

    UPDATE_FIELDS.forEach((f) => {
      if (data[f] != null) {
        const v = prepareInputValue(f, data[f]);
        if (v !== null) {
          updates.push(`${f} = @${f}`);
          request.input(f, FIELD_TYPES[f].type, v);
        }
      }
    });

    updates.push(`lcm = ${IST_NOW_SQL}`);

    if (updates.length === 1) {
      return res.status(400).json({
        success: false,
        message: 'No valid fields to update'
      });
    }

    await poolConnect;

    const result = await request.query(`
      UPDATE dbo.tbl_courier_partners
      SET ${updates.join(', ')}
      WHERE courier_partner_id = @courier_partner_id;

      SELECT @@ROWCOUNT AS affected;
    `);

    if (result.recordset[0].affected === 0) {
      return res
        .status(404)
        .json({ success: false, message: 'Courier partner not found' });
    }

    res.json({
      success: true,
      message: 'Courier partner updated'
    });
  } catch (err) {
    console.error('CourierPartners PUT error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

/* =========================================
   5) DELETE (SOFT DELETE)
========================================= */
router.delete('/', async (req, res) => {
  try {
    const { courier_partner_id, luu } = req.body;

    if (!courier_partner_id) {
      return res.status(400).json({
        success: false,
        message: 'courier_partner_id required'
      });
    }

    await poolConnect;

    const request = pool
      .request()
      .input('courier_partner_id', FIELD_TYPES.courier_partner_id.type, courier_partner_id);

    if (luu != null) {
      request.input('luu', FIELD_TYPES.luu.type, luu);
    }

    const query = `
      UPDATE dbo.tbl_courier_partners
      SET isdeleted = 1,
          ${luu ? 'luu = @luu,' : ''}
          lcm = ${IST_NOW_SQL}
      WHERE courier_partner_id = @courier_partner_id;

      SELECT @@ROWCOUNT AS affected;
    `;

    const result = await request.query(query);

    if (result.recordset[0].affected === 0) {
      return res
        .status(404)
        .json({ success: false, message: 'Courier partner not found' });
    }

    res.json({
      success: true,
      message: 'Courier partner deleted (soft)'
    });
  } catch (err) {
    console.error('CourierPartners DELETE error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

module.exports = router;
