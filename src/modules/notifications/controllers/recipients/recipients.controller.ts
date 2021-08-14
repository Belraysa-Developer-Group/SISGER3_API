import { client, envio, PrismaClient } from "@prisma/client";
import { Request, Response } from "express";
import { BadRequestError } from "../../../../errors/bad-request-error";

const prisma = new PrismaClient()

export const getRecipientsByContenedor = async ( req:Request, res:Response ): Promise<Response> => {

    const { id } = req.params

    try {
        const contenedor = await prisma.contenedor.findUnique({
            where:{
                id: parseInt(id)
            },
            include: {
                mes_contenedorTomes: {
                    include: {
                        anno_annoTomes:true
                    }
                },       
                tipocontenedor:true,
                concepto: {
                    include: {
                        client_clientToconcepto_consignado:true,
                        client_clientToconcepto_remitente:true,
                        bulto: {
                            include: {
                                mercancia: {
                                    include: {
                                        other_mercancia:true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        })

    
        if(!contenedor){
          throw new BadRequestError('No existe el contenedor')      
        }

        const { mes_contenedorTomes,tipocontenedor,concepto: conceptos ,...contenedorData } = contenedor

        const resp = {
            ...contenedorData,
            mes: mes_contenedorTomes?.nombre,
            anno: mes_contenedorTomes?.anno_annoTomes?.nombre,
            tipo: tipocontenedor?.nombre,
            conceptos: await Promise.all( conceptos.map( async (concepto) =>{

                let envioRemitente: client | null | envio = concepto.client_clientToconcepto_remitente;

                if( concepto.remitente ===null || concepto.tipo === "Envio"){
                    envioRemitente = await prisma.envio.findUnique({
                        where:{
                            id: concepto.id
                        }
                    })
                }

                return {
                    id: concepto.id,
                    tipo: concepto.tipo,
                    remitente:  envioRemitente,
                    consignado: {...concepto.client_clientToconcepto_consignado },
                    sisgerCode: concepto.sisgerCode,
                    expediente: concepto.expediente,
                    bultos: concepto.bulto
                }
            })) 
        }
        return res.json({
            resp
        })  
    } catch (error) {
        return res.json({
            error
        }) 
    }

    

}


