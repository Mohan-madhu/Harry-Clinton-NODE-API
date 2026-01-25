const express = require('express');
const router = express.Router();
const { pool, poolConnect, sql } = require('../../config/db_harry_clinton');

/** 
 * ==============================
 * REGISTER USER
 * ==============================
 * SP: sp_register_user
 * Inputs:
 *   @full_name
 *   @email_id
 *   @mobile_number
 *   @password_hash
 * @profile_url
 *   @rcu
 *
 * Outputs:
 *   @user_id (OUTPUT)
 *   @success (OUTPUT)
 *   @message (OUTPUT)
 */
router.post('/Register', async (req, res, next) => {
  let out = '';

  try {
    const data = req.body ?? {};

    // Validate required fields
    if (!data.full_name || !data.email_id || !data.password_hash || !data.rcu) {
      return res.status(405).json({
        Status: '0',
        Message: 'Required fields missing (full_name, email_id, password_hash, rcu)',
        Response: null,
        ResponseCode: '405',
        RequestReceived: data,
      });
    }

    await poolConnect;

    const request = pool.request()
      .input('full_name', sql.VarChar(255), data.full_name)
      .input('email_id', sql.VarChar(255), data.email_id)
      .input('mobile_number', sql.VarChar(50), data.mobile_number ?? null)
      .input('profile_url', sql.VarChar(255), data.profile_url ?? 'No File Uploaded')
      .input('password_hash', sql.VarChar(255), data.password_hash)
      .input('rcu', sql.VarChar(100), data.rcu)
      .output('user_id', sql.VarChar(36))
      .output('success', sql.Bit)
      .output('message', sql.VarChar(500));

    const result = await request.execute('sp_register_user');

    const success = result.output?.success ?? 0;
    const message = result.output?.message ?? '';
    const userId = result.output?.user_id ?? null;

    out = {
      Status: success.toString(),
      Message: message,
      Response: { user_id: userId },
      ResponseCode: '200',
      RequestReceived: data,
    };

    return res.json(out);

  } catch (err) {
    out = {
      Status: '0',
      Message: err.message,
      Response: null,
      ResponseCode: '500',
    };
    return res.status(500).json(out);
  }
});



/**
 * =========================
 * LOGIN USER
 * =========================
 * SP: sp_login_user
 *
 * Inputs:
 *   @email_id
 *   @password_hash
 *
 * Outputs:
 *   @user_id
 *   @full_name
 *   @email_verified
 *   @mobile_verified
 *   @mobile_number
 *   @success
 *   @message
 */
router.post('/Login', async (req, res, next) => {
  let out = '';

  try {
    const data = req.body ?? {};

    if (!data.email_id || !data.password_hash) {
      return res.status(405).json({
        Status: '0',
        Message: 'Required fields missing (email_id, password_hash)',
        Response: null,
        ResponseCode: '405',
        RequestReceived: data,
      });
    }

    await poolConnect;

    const request = pool.request()
      .input('email_id', sql.VarChar(255), data.email_id)
      .input('password_hash', sql.VarChar(255), data.password_hash)
      .output('success', sql.Bit)
      .output('message', sql.VarChar(500));

    const result = await request.execute('sp_login_user');

    const success = result.output?.success ?? 0;
    const message = result.output?.message ?? '';
    const userRow = result.recordset?.[0] ?? null; // <-- row from SELECT

    out = {
      Status: success.toString(),
      Message: message,
      Response: userRow, // <-- send full row data
      ResponseCode: '200',
      RequestReceived: data,
    };

    return res.json(out);
  } catch (err) {
    out = {
      Status: '0',
      Message: err.message,
      Response: null,
      ResponseCode: '500',
    };
    return res.status(500).json(out);
  }
});


/**
 * =========================
 * RESET PASSWORD
 * =========================
 * SP: sp_reset_password
 *
 * Inputs:
 *   @email_id
 *   @old_password_hash
 *   @new_password_hash
 *   @luu
 *
 * Outputs:
 *   @success
 *   @message
 */
router.post('/Reset-Password', async (req, res, next) => {
  let out = '';

  try {
    const data = req.body ?? {};

    if (!data.email_id || !data.old_password_hash || !data.new_password_hash || !data.luu) {
      return res.status(405).json({
        Status: '0',
        Message: 'Required fields missing (email_id, old_password_hash, new_password_hash, luu)',
        Response: null,
        ResponseCode: '405',
        RequestReceived: data,
      });
    }

    await poolConnect;

    const request = pool.request()
      .input('email_id', sql.VarChar(255), data.email_id)
      .input('old_password_hash', sql.VarChar(255), data.old_password_hash)
      .input('new_password_hash', sql.VarChar(255), data.new_password_hash)
      .input('luu', sql.VarChar(100), data.luu)
      .output('success', sql.Bit)
      .output('message', sql.VarChar(500));

    const result = await request.execute('sp_reset_password');

    const output = result.output ?? {};

    out = {
      Status: output.success?.toString?.() ?? '0',
      Message: output.message ?? '',
      Response: null,
      ResponseCode: '200',
      RequestReceived: data,
    };

    return res.json(out);

  } catch (err) {
    out = {
      Status: '0',
      Message: err.message,
      Response: null,
      ResponseCode: '500',
    };
    return res.status(500).json(out);
  }
});


/**
 * =========================
 * TEST PERFORMANCE ENDPOINT
 * =========================
 * Test endpoint to measure poolConnect latency
 * GET /API/HARRY-CLINTON/Auth/Test-Performance
 */
router.get('/Test-Performance', async (req, res) => {
  try {
    const { poolConnect } = require('../../config/db_harry_clinton');

    // Test 1: With await poolConnect (OLD WAY)
    const t0 = Date.now();
    await poolConnect;
    const t1 = Date.now();
    const awaitTime = t1 - t0;

    // Test 2: Direct query without await (NEW WAY)
    const t2 = Date.now();
    const result = await pool.request().query('SELECT 1 AS test');
    const t3 = Date.now();
    const directTime = t3 - t2;

    // Overall request time
    const totalTime = Date.now() - t0;

    return res.json({
      Status: '1',
      Message: 'Performance test completed',
      Response: {
        awaitPoolConnect_ms: awaitTime,
        directQuery_ms: directTime,
        totalRequest_ms: totalTime,
        improvement_percent: awaitTime > 0 ? Math.round(((awaitTime - directTime) / awaitTime) * 100) : 0,
        recommendation: awaitTime > 5 ? 'Remove await poolConnect from routes' : 'Pool already optimized'
      },
      ResponseCode: '200'
    });

  } catch (err) {
    return res.status(500).json({
      Status: '0',
      Message: err.message,
      Response: null,
      ResponseCode: '500'
    });
  }
});


module.exports = router;
