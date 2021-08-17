import { Request, Response } from "express"
import { Concepto, ContenedorNotification, TipoConcepto } from "../../interfaces/send-notification-request";
import { EmailService } from "../../services/email.service"
import { emailHtml, emailHeader } from '../../helpers/mail-template-generator';
import { BadRequestError } from '../../../../errors/bad-request-error';

interface ConceptosXEmailWrapper {
    [key: string]: Concepto[]
}

export const sendBulkMail = async ( req:Request, res:Response ): Promise<Response> => {

    const contenedorNotificationData: ContenedorNotification = req.body  
    let conceptosXEmailWrapper: ConceptosXEmailWrapper = {}

    contenedorNotificationData.conceptos.map( (concepto) =>{

        
        if(conceptosXEmailWrapper[concepto.consignado.email]){
            conceptosXEmailWrapper[concepto.consignado.email].push(concepto)
        }else{
            conceptosXEmailWrapper[concepto.consignado.email]=[concepto] 
        }


    })

    // console.log(conceptosXEmailWrapper)

    try {
        

        await Promise.all(Object.keys(conceptosXEmailWrapper).map( async email => {
            await emailHeader(contenedorNotificationData, conceptosXEmailWrapper[email])
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