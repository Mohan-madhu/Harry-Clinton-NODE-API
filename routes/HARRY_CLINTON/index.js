const express = require('express');
const router = express.Router();
const { poolConnect } = require('../../config/db_harry_clinton');

// Connect pool once when this module loads
poolConnect
  .then(() => console.log('✓ HARRY_CLINTON database pool connected'))
  .catch(err => console.error('✗ HARRY_CLINTON database pool connection failed:', err));

router.use('/Auth', require('./Auth'));
router.use('/FileUpload', require('./FileUpload'));
router.use('/Mail', require('./Mail'));

module.exports = router;
