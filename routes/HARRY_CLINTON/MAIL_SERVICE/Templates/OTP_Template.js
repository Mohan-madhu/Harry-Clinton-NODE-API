const { getBusinessName } = require("../config");

const createOTPEmailTemplate = (otp) => {
    const businessName = getBusinessName();
    
    return `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Preview text (hidden but shown in email clients when collapsed) -->
        <title>Your OTP Code - ${businessName}</title>
        <style>
            /* Hide preview text from actual email content */
            .preview-text {
                display: none;
                font-size: 1px;
                color: #ffffff;
                line-height: 1px;
                max-height: 0px;
                max-width: 0px;
                opacity: 0;
                overflow: hidden;
                mso-hide: all;
            }
            
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                line-height: 1.6;
                color: #333;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .email-container {
                max-width: 600px;
                margin: 0 auto;
                background-color: #ffffff;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .header {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 30px 20px;
                text-align: center;
            }
            .business-name {
                font-size: 32px;
                font-weight: bold;
                margin: 0;
                letter-spacing: 1px;
            }
            .business-tagline {
                font-size: 16px;
                opacity: 0.9;
                margin-top: 5px;
            }
            .content {
                padding: 40px 30px;
            }
            .greeting {
                font-size: 18px;
                margin-bottom: 20px;
                color: #333;
            }
            .otp-container {
                background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                color: white;
                padding: 25px;
                border-radius: 8px;
                text-align: center;
                margin: 30px 0;
            }
            .otp-code {
                font-size: 42px;
                font-weight: bold;
                letter-spacing: 5px;
                margin: 15px 0;
                font-family: monospace;
            }
            .otp-label {
                font-size: 14px;
                opacity: 0.9;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            .instructions {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                border-left: 4px solid #667eea;
                margin: 25px 0;
            }
            .instruction-title {
                color: #333;
                font-weight: bold;
                margin-bottom: 10px;
            }
            .instruction-list {
                margin: 0;
                padding-left: 20px;
            }
            .instruction-list li {
                margin-bottom: 8px;
            }
            .note {
                color: #666;
                font-size: 14px;
                text-align: center;
                margin-top: 30px;
                padding-top: 20px;
                border-top: 1px solid #eee;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 20px;
                text-align: center;
                border-top: 1px solid #e9ecef;
            }
            .contact-info {
                color: #666;
                font-size: 14px;
                margin-bottom: 10px;
            }
            .contact-info a {
                color: #667eea;
                text-decoration: none;
            }
            .copyright {
                color: #999;
                font-size: 12px;
                margin-top: 10px;
            }
            @media (max-width: 600px) {
                .content {
                    padding: 20px 15px;
                }
                .otp-code {
                    font-size: 32px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Preview Text - Shown when email is collapsed -->
        <div class="preview-text" style="display: none; font-size: 1px; color: #ffffff; line-height: 1px; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden; mso-hide: all;">
            Your One-Time Password for ${businessName}: ${otp}. Valid for 10 minutes. Do not share.
        </div>
        
        <div class="email-container">
            <!-- Header Section -->
            <div class="header">
                <h1 class="business-name">${businessName}</h1>
                <p class="business-tagline">Secure Access Portal</p>
            </div>
            
            <!-- Content Section -->
            <div class="content">
                <p class="greeting">Hello,</p>
                <p>You've requested a One-Time Password (OTP) to access your account. Here's your verification code:</p>
                
                <!-- OTP Display -->
                <div class="otp-container">
                    <div class="otp-label">Your Verification Code</div>
                    <div class="otp-code">${otp}</div>
                    <div class="otp-label">Valid for 10 minutes</div>
                </div>
                
                <!-- Instructions -->
                <div class="instructions">
                    <div class="instruction-title">Important Instructions:</div>
                    <ul class="instruction-list">
                        <li>Enter this code on the verification page to complete your login</li>
                        <li>This code will expire in 10 minutes</li>
                        <li>Do not share this code with anyone</li>
                        <li>If you didn't request this code, please ignore this email</li>
                    </ul>
                </div>
                
                <p class="note">
                    For security reasons, never share your OTP with anyone. ${businessName} will never ask for your password or OTP via email or phone.
                </p>
            </div>
            
            <!-- Footer Section -->
            <div class="footer">
                <div class="contact-info">
                    Need help? Contact us at 
                    <a href="mailto:support@harryclinton.com">support@harryclinton.com</a>
                </div>
                <div class="copyright">
                    &copy; ${new Date().getFullYear()} ${businessName}. All rights reserved.
                </div>
            </div>
        </div>
    </body>
    </html>
    `;
};

const createOTPTextTemplate = (otp) => {
    const businessName = getBusinessName();
    
    return `
${businessName} - Secure Access Portal
========================================

Your One-Time Password (OTP) Code: ${otp}

This OTP is valid for 10 minutes.

Important Instructions:
1. Enter this code on the verification page to complete your login
2. This code will expire in 10 minutes
3. Do not share this code with anyone
4. If you didn't request this code, please ignore this email

Security Notice:
For security reasons, never share your OTP with anyone. ${businessName} will never ask for your password or OTP via email or phone.

Need help? Contact us at support@harryclinton.com

© ${new Date().getFullYear()} ${businessName}. All rights reserved.
========================================`;
};

module.exports = {
    createOTPEmailTemplate,
    createOTPTextTemplate
};