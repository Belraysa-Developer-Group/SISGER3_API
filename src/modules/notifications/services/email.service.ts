import nodemailer from 'nodemailer';
import SMTPTransport from 'nodemailer/lib/smtp-transport';

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
    name: 'belraysatours.com',
    host: 'mail.belraysatours.com',
    port: 465,
    secure: true,
    auth: {
      user: 'devteam@belraysatours.com',
      pass: 'p_m#-B2nMaDN'
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

