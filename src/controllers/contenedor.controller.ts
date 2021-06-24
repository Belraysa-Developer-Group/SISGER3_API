import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient()

export const getContenedoresByMes = async ( req:Request, res:Response ): Promise<Response> => {

    const { idMes } = req.params

    const contenedores = await prisma.contenedor.findMany({
        where:{
            mes: parseInt(idMes)
        },
        include:{
            tipocontenedor:true,
            concepto: {
                include: {
                    bulto: {
                        include: {
                            concepto_bultoToconcepto:true,
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


    return res.json(contenedores)
}

export const getContenedoresById = async ( req:Request, res:Response ): Promise<Response> => {

    const { id } = req.params

    const contenedor = await prisma.contenedor.findUnique({
        where:{
            id: parseInt(id)
        },
        include:{
            tipocontenedor:true,
            concepto: {
                include: {
                    
                    bulto: {
                        include: {
                            concepto_bultoToconcepto:{
                                include:{
                                    client_clientToconcepto_consignado:true,
                                    client_clientToconcepto_remitente:true,
                                }
                            },
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


    return res.json(contenedor)
}