import { bulto, PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient()


export const getBultoById = async ( req:Request, res:Response ): Promise<Response> => {

    const { id } = req.params

    const bulto = await prisma.bulto.findUnique({
        where:{
            id: parseInt(id)
        }
    })


    return res.json(bulto)
}

export const updateBultoById = async ( req:Request, res:Response ): Promise<Response> => {

    const { id } = req.params
    const {concepto,dentro,indice,pared,sisgerCode}:bulto = req.body

    try {
       
        const bulto = await prisma.bulto.update({
            where: {
                id: parseInt(id)
            },
            data:{
                concepto,dentro,indice,pared,sisgerCode
            },
            include:{
                concepto_bultoToconcepto:true,
                mercancia:true
            }
        })
        return res.status(200).json({
            ok:     true,
            msg:    "bulto actualizado",
            data:   bulto
        })
    } catch (error) {
        return res.status(400).json({
            ok:     true,
            msg:    "No se pudo actualizar el bulto"
        })      
    }


}