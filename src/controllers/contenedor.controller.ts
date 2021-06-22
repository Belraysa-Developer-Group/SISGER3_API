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

    console.log(idMes)
    return res.json({
        'ok': true,
        contenedores
    })
}