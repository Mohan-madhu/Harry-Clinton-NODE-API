// routes/Coupons.js (HARRY_CLINTON) - BASIC CRUD (5 endpoints)

const express = require('express');
const router = express.Router();
const { pool, poolConnect, sql } = require('../../../config/db_harry_clinton');

/* =========================================
   FIELD TYPES
========================================= */
const FIELD_TYPES = {
  coupon_id: { type: sql.VarChar, maxLength: 36 },
  coupon_code: { type: sql.VarChar, maxLength: 50 },
  description: { type: sql.VarChar, maxLength: 255 },
  discount_id: { type: sql.VarChar, maxLength: 36 },

  start_date: { type: sql.DateTime },
  end_date: { type: sql.DateTime },

  usage_limit: { type: sql.Int },
  per_user_limit: { type: sql.Int },

  min_order_amount: { type: sql.Decimal, precision: 18, scale: 2 },
  max_discount_amount: { type: sql.Decimal, precision: 18, scale: 2 },

  isactive: { type: sql.Bit },
  isdeleted: { type: sql.Bit },

  rcu: { type: sql.VarChar, maxLength: 100 },
  rcm: { type: sql.DateTime },
  luu: { type: sql.VarChar, maxLength: 100 },
  lcm: { type: sql.DateTime }
};

const INSERT_FIELDS = [
  'coupon_code',
  'description',
  'discount_id',
  'start_date',
  'end_date',
  'usage_limit',
  'per_user_limit',
  'min_order_amount',
  'max_discount_amount',
  'rcu'
];

const UPDATE_FIELDS = [
  'description',
  'discount_id',
  'start_date',
  'end_date',
  'usage_limit',
  'per_user_limit',
  'min_order_amount',
  'max_discount_amount',
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

  if (field === 'usage_limit' || field === 'per_user_limit') {
    const num = parseInt(value, 10);
    return !isNaN(num) && num > 0 ? num : null;
  }

  if (field === 'min_order_amount' || field === 'max_discount_amount') {
    const num = parseFloat(value);
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
      FROM dbo.tbl_coupons
      ${where.length ? `WHERE ${where.join(' AND ')}` : ''}
      ORDER BY rcm DESC;
    `;

    const result = await pool.request().query(query);

    res.json({
      success: true,
      data: result.recordset,
      count: result.recordset.length
    });
  } catch (err) {
    console.error('Coupons GET error:', err);
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
        .json({ success: false, message: 'coupon_id required' });
    }

    await poolConnect;

    const request = pool
      .request()
      .input('coupon_id', FIELD_TYPES.coupon_id.type, id);

    const result = await request.query(`
      SELECT *
      FROM dbo.tbl_coupons
      WHERE coupon_id = @coupon_id
        AND isdeleted = 0;
    `);

    if (result.recordset.length === 0) {
      return res
        .status(404)
        .json({ success: false, message: 'Coupon not found' });
    }

    res.json({ success: true, data: result.recordset[0] });
  } catch (err) {
    console.error('Coupons GET BY ID error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

/* =========================================
   3) POST (CREATE)
========================================= */
router.post('/', async (req, res) => {
  try {
    const data = req.body;

    if (!data.coupon_code) {
      return res.status(400).json({
        success: false,
        message: 'coupon_code required'
      });
    }

    if (data.usage_limit && parseInt(data.usage_limit, 10) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'usage_limit must be greater than 0'
      });
    }

    if (data.per_user_limit && parseInt(data.per_user_limit, 10) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'per_user_limit must be greater than 0'
      });
    }

    if (data.min_order_amount && parseFloat(data.min_order_amount) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'min_order_amount must be greater than 0'
      });
    }

    if (data.max_discount_amount && parseFloat(data.max_discount_amount) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'max_discount_amount must be greater than 0'
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

    try {
      const result = await request.query(`
        INSERT INTO dbo.tbl_coupons (${cols.join(',')})
        OUTPUT INSERTED.*
        VALUES (${vals.join(',')});
      `);

      res.status(201).json({
        success: true,
        data: result.recordset[0]
      });
    } catch (err) {
      if (err.message.includes('Violation of UNIQUE KEY constraint')) {
        return res.status(409).json({
          success: false,
          message: 'coupon_code already exists'
        });
      }
      throw err;
    }
  } catch (err) {
    console.error('Coupons POST error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

/* =========================================
   4) PUT (UPDATE)
========================================= */
router.put('/', async (req, res) => {
  try {
    const data = req.body;

    if (!data.coupon_id) {
      return res.status(400).json({
        success: false,
        message: 'coupon_id required'
      });
    }

    if (data.usage_limit && parseInt(data.usage_limit, 10) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'usage_limit must be greater than 0'
      });
    }

    if (data.per_user_limit && parseInt(data.per_user_limit, 10) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'per_user_limit must be greater than 0'
      });
    }

    if (data.min_order_amount && parseFloat(data.min_order_amount) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'min_order_amount must be greater than 0'
      });
    }

    if (data.max_discount_amount && parseFloat(data.max_discount_amount) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'max_discount_amount must be greater than 0'
      });
    }

    const updates = [];
    const request = pool.request();

    request.input(
      'coupon_id',
      FIELD_TYPES.coupon_id.type,
      data.coupon_id
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
      UPDATE dbo.tbl_coupons
      SET ${updates.join(', ')}
      WHERE coupon_id = @coupon_id;

      SELECT @@ROWCOUNT AS affected;
    `);

    if (result.recordset[0].affected === 0) {
      return res
        .status(404)
        .json({ success: false, message: 'Coupon not found' });
    }

    res.json({
      success: true,
      message: 'Coupon updated'
    });
  } catch (err) {
    console.error('Coupons PUT error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

/* =========================================
   5) DELETE (SOFT DELETE)
========================================= */
router.delete('/', async (req, res) => {
  try {
    const { coupon_id, luu } = req.body;

    if (!coupon_id) {
      return res.status(400).json({
        success: false,
        message: 'coupon_id required'
      });
    }

    await poolConnect;

    const request = pool
      .request()
      .input('coupon_id', FIELD_TYPES.coupon_id.type, coupon_id);

    if (luu != null) {
      request.input('luu', FIELD_TYPES.luu.type, luu);
    }

    const query = `
      UPDATE dbo.tbl_coupons
      SET isdeleted = 1,
          ${luu ? 'luu = @luu,' : ''}
          lcm = ${IST_NOW_SQL}
      WHERE coupon_id = @coupon_id;

      SELECT @@ROWCOUNT AS affected;
    `;

    const result = await request.query(query);

    if (result.recordset[0].affected === 0) {
      return res
        .status(404)
        .json({ success: false, message: 'Coupon not found' });
    }

    res.json({
      success: true,
      message: 'Coupon deleted (soft)'
    });
  } catch (err) {
    console.error('Coupons DELETE error:', err);
    res.status(500).json({ success: false, message: err.message });
  }
});

module.exports = router;
