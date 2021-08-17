import { mercancia } from '@prisma/client';
import { ContenedorNotification, Concepto, Mercancia } from '../interfaces/send-notification-request';
import { EmailService } from '../services/email.service';
import { dateParser } from './date-parser';

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

                        let mercanciaAgrupada = {
                            pesoKg: 0,
                            descripcion: "",
                            volumenM3: 0,
                        }

                        concepto.bultos.map( bulto => {
    
                            const mercanciaAcc = bulto.mercancia.reduce((accumulator, currentValue) => {
                                accumulator.pesoKg += currentValue.pesoKg
                                accumulator.descripcion += ', '+ currentValue.descripcion
                                accumulator.volumenM3 += currentValue.volumenM3
                                
                                return accumulator
                            })

                            mercanciaAgrupada.pesoKg += mercanciaAcc.pesoKg
                            mercanciaAgrupada.descripcion += mercanciaAcc.descripcion
                            mercanciaAgrupada.volumenM3 += mercanciaAcc.volumenM3
                        })
                            
    
                        

                        return `
                        <tr>
                            <td>${concepto.sisgerCode}</td>
                            <td>${concepto.remitente.remitenteNombre}</td>
                            <td>${concepto.consignatario.firstName} ${concepto.consignatario.lastName}</td>
                            <td>${concepto.consignatario.address}, ${concepto.consignatario.municipality}, ${concepto.consignatario.province}, ${concepto.consignatario.country}</td>
                            <td>${concepto.consignatario.dni}</td>
                            <td>${concepto.consignatario.phones || ""}</td>
                            <td>${concepto.consignatario.cell || ""}</td>
                            <td>${concepto.consignatario.email}</td>
                            <td>${concepto.bultos.length}</td>
                            <td>${mercanciaAgrupada.pesoKg}</td>   
                            <td>${mercanciaAgrupada.volumenM3}</td>   
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
        to: "a.fernandez.ro7@gmail.com", // list of receivers
        subject: `NOTIFICACIÓN DE ENVÍO DE CARGA ${conceptos[0].consignatario.email}✔`, // Subject line
        text: "Notificación", // plain text body
        html: emailHtml(contenedorNotificationData, conceptos), // html body
    });
    await email.send()

    
}