import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient()

export const getAnnos = async ( req:Request, res:Response ): Promise<Response> => {


    const annos = await prisma.anno.findMany({
        include: {
            mes:{
                include:{
                    contenedor: {
                        include:{
                            tipocontenedor:true
                        }
                    }
                }
            }
        }
    })
    console.log(annos)

    return res.json({
        annos
    })  
}