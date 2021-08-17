import { mercancia } from '@prisma/client';
import { ContenedorNotification, Concepto, Mercancia } from '../interfaces/send-notification-request';
import { EmailService } from '../services/email.service';
import { dateParser } from './date-parser';
import { mercanciaGrouper } from './mercancia-grouper';

export const emailHtml = (contenedorNotificationData: ContenedorNotification, conceptos: Concepto[])=> {
    
    return `
    <head>

        <style>

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        </style>

    </head>
    <body>
        <p><b>Este es un mensaje informativo, por favor, NO RESPONDER, salvo en caso muy necesario.</b></p>
        
        <p>Su carga se encuentra  en el contenedor <b>${contenedorNotificationData.codigo}</b>, 
        con Master BL: <b>${contenedorNotificationData.mbl}</b>, 
        a bordo del buque <b>${contenedorNotificationData.motonave}</b> con fecha de salida de 
        <b>${contenedorNotificationData.puertoSalida}</b> 
        el día <b>${dateParser(contenedorNotificationData.fechaSalida)}</b> y 
        fecha estimada de arribo a ${contenedorNotificationData.puertoEntrada} 
        el <b>${dateParser(contenedorNotificationData.fechaEntrada)}</b>. 
        Usted debe recibir un mensaje de texto en su móvil (sms), 
        correo electrónico o llamada telefónica de la Agencia Aduanal y 
        Transitaria Palco; indicándole el día en que debe presentarse a retirar su carga en el depósito asignado. Es por orden de llegada y para retirar su carga, usted o su apoderado,deben presentar los documentos de identidad requeridos para el ENA o ENVIO según sea su caso.</p>
        
        <p>A continuación los detalles de su carga: </p>
        <br>
        <br>
        
        <table>
            <thead>
                <tr>
                    <th>HBL Número</th>
                    <th>Nombre y Dirección/ RTTE</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>ID</th>
                    <th>Teléfono</th>
                    <th>Móvil</th>
                    <th>Email</th>
                    <th>Cant. Bultos</th>
                    <th>Peso (Kg)</th>
                    <th>CBM</th>
                    <th>Descripción</th>
                    <th>Categoría</th>
                </tr>
            </thead>
            <tbody>
                ${
                    conceptos.map( concepto =>{

                        const mercanciaAgrupada = mercanciaGrouper(concepto)
                            
                        return `
                        <tr>
                            <td>${concepto.sisgerCode}</td>
                            <td>${concepto.remitente.remitenteNombre}</td>
                            <td>${concepto.consignado.firstName} ${concepto.consignado.lastName}</td>
                            <td>${concepto.consignado.address}, ${concepto.consignado.municipality}, ${concepto.consignado.province}, ${concepto.consignado.country}</td>
                            <td>${concepto.consignado.dni}</td>
                            <td>${concepto.consignado.phones || ""}</td>
                            <td>${concepto.consignado.cell || ""}</td>
                            <td>${concepto.consignado.email}</td>
                            <td>${concepto.bultos.length}</td>
                            <td>${mercanciaAgrupada.pesoKg.toFixed(2)}</td>   
                            <td>${mercanciaAgrupada.volumenM3.toFixed(2)}</td>   
                            <td>${mercanciaAgrupada.descripcion}</td>   
                            <td>${concepto.tipo}</td>   
                        </tr>`
                    }).join(' ')
                }
            </tbody>
        </table>
    </body>
    `
};

export const emailHeader = async (contenedorNotificationData: ContenedorNotification, conceptos: Concepto[]) =>{

    const email = new EmailService({
        from: '"Logística Belraysa 👻" <devteam@belraysatours.com>', // sender address
        to: "a.fernandez.ro7@gmail.com", // list of receivers, logistica@belraysatours.com
        subject: `NOTIFICACIÓN DE ENVÍO DE CARGA ${conceptos[0].consignado.email}✔`, // Subject line
        text: "Notificación", // plain text body
        html: emailHtml(contenedorNotificationData, conceptos), // html body
    });
    await email.send()

    
}