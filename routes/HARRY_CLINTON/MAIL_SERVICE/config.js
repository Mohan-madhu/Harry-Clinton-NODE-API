const nodemailer = require('nodemailer');
require('dotenv').config();

const getDefaultFromAddress = () => {
    return 'Harry Clinton <otp.harryclinton@gmail.com>';
};

const getBusinessName = () => {
    return 'Harry Clinton';
};

const createTransporter = () => {
    return nodemailer.createTransport({
        host: process.env.C_HARRY_CLINTON_SMTP_HOST,
        port: process.env.C_HARRY_CLINTON_SMTP_PORT,
        secure: process.env.C_HARRY_CLINTON_SMTP_SECURE === 'true',
        auth: {
            user: process.env.C_HARRY_CLINTON_SMTP_USER,
            pass: process.env.C_HARRY_CLINTON_SMTP_PASS
        }
    });
};



module.exports = {
    createTransporter,
    getDefaultFromAddress,
    getBusinessName
};