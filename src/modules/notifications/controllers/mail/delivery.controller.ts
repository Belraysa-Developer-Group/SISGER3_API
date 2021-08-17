import { Request, Response } from "express"
import { Concepto, ContenedorNotification, TipoConcepto } from "../../interfaces/send-notification-request";
import { EmailService } from "../../services/email.service"
import { emailHtml, emailHeader } from '../../helpers/mail-template-generator';
import { BadRequestError } from '../../../../errors/bad-request-error';

interface EnviosXEmailWrapper {
    [key: string]: Concepto[]
}

export const sendBulkMail = async ( req:Request, res:Response ): Promise<Response> => {

    const contenedorNotificationData: ContenedorNotification = req.body  
    let enviosXEmailWrapper: EnviosXEmailWrapper = {}
    let enasMenagesXEmailWrapper: Promise<void>[] = []

    contenedorNotificationData.conceptos.map( (concepto, index) =>{

        switch (concepto.tipo) {
            case TipoConcepto.ENA || TipoConcepto.MENAJE:
                enasMenagesXEmailWrapper.push(emailHeader(contenedorNotificationData, [concepto])) 
                break;                    
            ;
            case TipoConcepto.ENVIO:
                if(enviosXEmailWrapper[concepto.consignatario.email]){
                    enviosXEmailWrapper[concepto.consignatario.email].push(concepto)
                }else{
                    enviosXEmailWrapper[concepto.consignatario.email]=[concepto] 
                }
                break;           
            default:
                break;
        }       


    })

    // console.log(enviosXEmailWrapper)

    try {
        
        await Promise.all(enasMenagesXEmailWrapper!)

        await Promise.all(Object.keys(enviosXEmailWrapper!).map( async email => {
            await emailHeader(contenedorNotificationData, enviosXEmailWrapper[email])
        }))

    } catch (error) {
        console.log(error)
    }
        

    return res.json({})

        
        

    
    
}



                // switch (concepto.tipo) {
                //     case TipoConcepto.ENA || TipoConcepto.MENAJE:
                //         await emailHeader(contenedorNotificationData, [concepto])                    
                //         break;
                //     case TipoConcepto.ENVIO:
                //         enviosXEmailWrapper[concepto.consignatario.email].push(concepto)
                //         break;           
                //     default:
                //         break;
                // }          