import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const prisma = new PrismaClient()

export const getClientById = async ( req:Request, res:Response ): Promise<Response> => {
    const { id } = req.params

    const client = await prisma.client.findUnique({
        where:{
            id: parseInt(id)
        }
    })
    return res.json(client)
}