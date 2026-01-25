const bcrypt = require('bcryptjs');
const { v4: uuidv4 } = require('uuid');

// Hash password
const hashPassword = async (password) => {
  const saltRounds = 10;
  return await bcrypt.hash(password, saltRounds);
};

// Compare password with hash
const comparePassword = async (password, hash) => {
  return await bcrypt.compare(password, hash);
};

// Generate token
const generateToken = () => {
  return uuidv4();
};

// Response formatter
const formatResponse = (success, message, data = null) => {
  return {
    success,
    message,
    data,
timestamp: new Intl.DateTimeFormat('en-CA', {
  timeZone: 'Asia/Kolkata',
  year: 'numeric',
  month: '2-digit',
  day: '2-digit',
  hour: '2-digit',
  minute: '2-digit',
  second: '2-digit'
}).format(new Date())

  };
};

module.exports = {
  hashPassword,
  comparePassword,
  generateToken,
  formatResponse
};
