import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient()

export const getRecipientsByContenedor = async ( req:Request, res:Response ): Promise<Response> => {

    const { id } = req.params

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

    let resp = {}

    if(contenedor){

        const { mes_contenedorTomes,tipocontenedor,concepto: conceptos ,...contenedorData } = contenedor

        resp = {
            ...contenedorData,
            conceptos: conceptos.map( (concepto) =>{
                return {
                    id: concepto.id,
                    tipo: concepto.tipo,
                    remitente: concepto.remitente,
                    consignado: {...concepto.client_clientToconcepto_consignado },
                    sisgerCode: concepto.sisgerCode,
                    expediente: concepto.expediente,
                    bultos: concepto.bulto
                }
            })
        }
    }

    return res.json({
        resp
    })  
}