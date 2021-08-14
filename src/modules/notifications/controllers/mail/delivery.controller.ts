import { Request, Response } from "express"
import { EmailService } from "../../services/email.service"
// import nodemailer from 'nodemailer'


export const sendBulkMail = async ( req:Request, res:Response ): Promise<Response> => {
    
    try {
        const email = new EmailService({
            from: '"Albert el magnifico 👻" <devteam@belraysatours.com>', // sender address
            to: "a.fernandez.ro7@gmail.com", // list of receivers
            subject: "Hello ✔", // Subject line
            text: "Hello world?", // plain text body
            html: "<b>Hello world? este es un mensaje desde node. NO TE VOY ARREGLLAR NI PI</b>", // html body
        });

        await email.send()
    } catch (error) {
        console.log(error)
    }

  
  return res.json({})
}




