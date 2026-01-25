// routes/User.js (EEMAN)
const express = require('express');
const router = express.Router();
const { pool, poolConnect, sql } = require('../../config/db_eeman');

const FIELD_TYPES = {
  userid: { type: sql.NVarChar, maxLength: 50 },
  loginid: { type: sql.NVarChar, maxLength: 50 },
  firstname: { type: sql.NVarChar, maxLength: 100 },
  lastname: { type: sql.NVarChar, maxLength: 100 },
  phonenumber: { type: sql.NVarChar, maxLength: 20 },
  email: { type: sql.NVarChar, maxLength: 150 },
  address: { type: sql.NVarChar, maxLength: 500 },
  city: { type: sql.NVarChar, maxLength: 150 },
  state: { type: sql.NVarChar, maxLength: 150 },
  pincode: { type: sql.NVarChar, maxLength: 20 },
  status: { type: sql.Int },
  rcu: { type: sql.NVarChar, maxLength: 50 },
  luu: { type: sql.NVarChar, maxLength: 50 }
};

const INSERT_FIELDS = [
  'loginid','firstname','lastname','phonenumber','email','address','city','state','pincode','rcu'
];
const UPDATE_FIELDS = ['firstname','lastname','phonenumber','email','address','city','state','pincode','status','luu'];

const prepareInputValue = (field, value) => {
  if (value === null || value === undefined || value === '') return null;
  if (FIELD_TYPES[field].type.name === 'Int') return parseInt(value);
  return typeof value === 'string' ? value.trim() : value;
};

router.get('/', async (req, res) => {
  try {
    await poolConnect;
    const result = await pool.request().query('SELECT * FROM tbl_users;');
    res.json({ success: true, data: result.recordset, count: result.recordset.length });
  } catch (err) {
    console.error('EEMAN Users get error:', err);
    res.status(500).json({ success: false, message: 'Internal server error', error: err.message });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const id = req.params.id;
    if (!id) return res.status(400).json({ success: false, message: 'User id required' });
    await poolConnect;
    const result = await pool.request().input('userid', FIELD_TYPES.userid.type, id).query('SELECT * FROM tbl_users WHERE userid = @userid;');
    if (result.recordset.length === 0) return res.status(404).json({ success: false, message: 'User not found' });
    res.json({ success: true, data: result.recordset[0] });
  } catch (err) {
    console.error('EEMAN Users get by id error:', err);
    res.status(500).json({ success: false, message: 'Internal server error', error: err.message });
  }
});

router.post('/', async (req, res) => {
  try {
    const data = req.body;
    if (!data || Object.keys(data).length === 0) return res.status(400).json({ success: false, message: 'No data' });

    const cols = [];
    const vals = [];
    const request = pool.request();

    INSERT_FIELDS.forEach(f => {
      if (data[f] != null) {
        const v = prepareInputValue(f, data[f]);
        if (v !== null) {
          cols.push(f);
          vals.push('@' + f);
          request.input(f, FIELD_TYPES[f].type, v);
        }
      }
    });

    if (cols.length === 0) return res.status(400).json({ success: false, message: 'No valid fields' });

    await poolConnect;
    const result = await request.query(`INSERT INTO tbl_users (${cols.join(',')}) OUTPUT INSERTED.* VALUES (${vals.join(',')});`);
    res.status(201).json({ success: true, data: result.recordset });
  } catch (err) {
    console.error('EEMAN Users post error:', err);
    res.status(500).json({ success: false, message: 'Internal server error', error: err.message });
  }
});

router.put('/', async (req, res) => {
  try {
    const data = req.body;
    if (!data || !data.userid) return res.status(400).json({ success: false, message: 'userid required' });

    const updates = [];
    const request = pool.request();
    request.input('userid', FIELD_TYPES.userid.type, data.userid);

    UPDATE_FIELDS.forEach(f => {
      if (data[f] != null) {
        const v = prepareInputValue(f, data[f]);
        if (v !== null) {
          updates.push(`${f} = @${f}`);
          request.input(f, FIELD_TYPES[f].type, v);
        }
      }
    });

    updates.push('lum = DATEADD(MINUTE, 330, GETUTCDATE())');
    const setClause = updates.join(', ');
    await poolConnect;
    const result = await request.query(`UPDATE tbl_users SET ${setClause} WHERE userid = @userid; SELECT @@ROWCOUNT AS affected;`);
    if (result.recordset[0].affected === 0) return res.status(404).json({ success: false, message: 'User not found' });
    res.json({ success: true, message: 'User updated' });
  } catch (err) {
    console.error('EEMAN Users put error:', err);
    res.status(500).json({ success: false, message: 'Internal server error', error: err.message });
  }
});

router.delete('/', async (req, res) => {
  try {
    const { userid } = req.body;
    if (!userid) return res.status(400).json({ success: false, message: 'userid required' });
    await poolConnect;
    const result = await pool.request().input('userid', FIELD_TYPES.userid.type, userid).query('DELETE FROM tbl_users WHERE userid = @userid; SELECT @@ROWCOUNT AS affected;');
    if (result.recordset[0].affected === 0) return res.status(404).json({ success: false, message: 'User not found' });
    res.json({ success: true, message: 'User deleted' });
  } catch (err) {
    console.error('EEMAN Users delete error:', err);
    res.status(500).json({ success: false, message: 'Internal server error', error: err.message });
  }
});

module.exports = router;
