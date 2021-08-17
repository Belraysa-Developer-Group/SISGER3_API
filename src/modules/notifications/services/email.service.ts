import nodemailer from 'nodemailer';
import SMTPTransport from 'nodemailer/lib/smtp-transport';
import { mailkeys as MAILCONFIG} from './keys.env';

interface EmailI {
  info: {
    from: string;
    to: string;
    subject: string
    text: string;
    html: string
  } ;

  transporter: nodemailer.Transporter<SMTPTransport.SentMessageInfo>

  send():void
}

export class EmailService implements EmailI {

  transporter = nodemailer.createTransport({
    name: MAILCONFIG.TR_NAME,
    host: MAILCONFIG.TR_HOST,
    port: MAILCONFIG.TR_PORT,
    secure: MAILCONFIG.TR_SECURE,
    auth: {
      user: MAILCONFIG.TR_USER,
      pass: MAILCONFIG.TR_PASSWORD
    }
    // ,
    // tls: {
    //   rejectUnauthorized: false
    // }
  })
  
  constructor(public info: EmailI["info"]) {
  
  }

  // async..await is not allowed in global scope, must use a wrapper
  async send() {
    
    // send mail with defined transport object
    let info = await this.transporter.sendMail(this.info);
  
    console.log("Message sent: %s", info.messageId);
    // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>
  
    
  }
}

