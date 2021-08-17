import { Concepto, Mercancia } from '../interfaces/send-notification-request';


export const mercanciaGrouper = (concepto:Concepto) => {

    let mercanciaAgrupada = {
        pesoKg: 0,
        descripcion: "",
        volumenM3: 0,
    }

    concepto.bultos.map( (bulto,i) => {
    
        const mercanciaAcc = bulto.mercancia.reduce((accumulator, currentValue) => {
            
            let accTemp: Mercancia = {...accumulator} 
    
            accTemp.pesoKg += currentValue.pesoKg
            accTemp.descripcion += `, ${currentValue.descripcion}`
            accTemp.volumenM3 += currentValue.volumenM3
            
            return accTemp
        })
    
        mercanciaAgrupada.pesoKg += mercanciaAcc.pesoKg
        mercanciaAgrupada.descripcion += `${mercanciaAcc.descripcion}, `
        mercanciaAgrupada.volumenM3 += mercanciaAcc.volumenM3
    
        // console.log('bulto'+(i+1),mercanciaAgrupada)
    })

    return mercanciaAgrupada
}


