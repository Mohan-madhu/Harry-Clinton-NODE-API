const express = require('express');
const router = express.Router();
const { pool, poolConnect, sql } = require('../../config/db_harry_clinton');
const EmailService = require('./MAIL_SERVICE/services');

var E_Mail_OTP_Map = new Map();


const E_MAIL_SERVICE = new EmailService();

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
router.post('/OTP-Login', async (req, res, next) => {
  let out = '';

  try {
    const data = req.body ?? {};

    if (!data.email_id ) {
      return res.status(405).json({
        Status: '0',
        Message: 'Required fields missing (email_id)',
        Response: null,
        ResponseCode: '405',
        RequestReceived: data,
      });
    }

    await poolConnect;

    const request = pool.request()
      .input('email_id', sql.VarChar(255), data.email_id)
      .output('success', sql.Bit)
      .output('message', sql.VarChar(500));

    const result = await request.execute('sp_otp_login_user');

    const success = result.output?.success ?? 0;
    const message = result.output?.message ?? '';
    const userRow = result.recordset?.[0] ?? null; // <-- row from SELECT




    if (success === true && userRow) {
      const Data = {
        Status: success.toString(),
        Message: message,
        Response: userRow, // <-- send full row data
        ResponseCode: '200',
        RequestReceived: data,
      };

      console.log('User logged in successfully:', userRow.email_id);
      const OTP = Math.floor(1000 + Math.random() * 9000);
      const E_MAIL = data.email_id;

      // Store OTP immediately with pending email status
      E_Mail_OTP_Map.set(E_MAIL, {
        OTP: OTP,
        DATA: Data,
        emailSent: false,
        emailError: null
      });

      // Send email async without waiting
      E_MAIL_SERVICE.sendOTPEmail(E_MAIL, OTP)
        .then(mailRes => {
          console.log('OTP Email sent successfully:', mailRes.messageId);
          const entry = E_Mail_OTP_Map.get(E_MAIL);
          if (entry) {
            entry.emailSent = true;
            E_Mail_OTP_Map.set(E_MAIL, entry);
          }
        })
        .catch(mailErr => {
          console.error('Error sending OTP Email:', mailErr);
          const entry = E_Mail_OTP_Map.get(E_MAIL);
          if (entry) {
            entry.emailError = mailErr.message;
            E_Mail_OTP_Map.set(E_MAIL, entry);
          }
        });


      out = {
        Status: 1,
        Message: 'User Data Exists. OTP Sent',
        ResponseCode: '200',
        RequestReceived: data,
      };

      return res.json(out);

    }

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

router.post('/Password-Login', async (req, res, next) => {
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

router.post('/Verify-Login-OTP', async (req, res, next) => {
  let out = '';

  try {
    const data = req.body ?? {};

    if (!data.email_id || !data.otp) {
      return res.status(405).json({
        Status: '0',
        Message: 'Required fields missing (email_id, otp)',
        Response: null,
        ResponseCode: '405',
        RequestReceived: data,
      });
    }

    const storedEntry = E_Mail_OTP_Map.get(data.email_id);

    if (!storedEntry) {
      out = {
        Status: '0',
        Message: 'No OTP request found for this email',
        Response: null,
        ResponseCode: '200',
        RequestReceived: data,
      };
      return res.json(out);
    }

    // Check if email failed to send
    if (storedEntry.emailError) {
      E_Mail_OTP_Map.delete(data.email_id);
      out = {
        Status: '0',
        Message: 'Email failed to send: ' + storedEntry.emailError,
        Response: null,
        ResponseCode: '200',
        RequestReceived: data,
      };
      return res.json(out);
    }

    // Verify OTP
    if (storedEntry.OTP.toString() === data.otp.toString()) {

      out = storedEntry.DATA;
      E_Mail_OTP_Map.delete(data.email_id); // Invalidate OTP after successful verification
      return res.json(out);
    } else {
      out = {
        Status: '0',
        Message: 'Invalid OTP',
        Response: null,
        ResponseCode: '200',
        RequestReceived: data,
      };
    }

    return res.json(out);

  } catch (err) {
    out = {
      Status: '0',
      Message: err.message,
      Response: null,
      ResponseCode: '500',
      RequestReceived: data,
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




module.exports = router;
