export interface ContenedorNotification {
    id:            number;
    codigo:        string;
    mbl:           string;
    motonave:      string;
    fechaSalida:   string;
    fechaEntrada:  string;
    puertoSalida:  string;
    puertoEntrada: string;
    conceptos:     Concepto[];
}

export interface Concepto {
    id:            number;
    tipo:          TipoConcepto;
    sisgerCode:    string;
    remitente:     Remitente;
    consignado:    Consignado;
    bultos:        Bulto[];
}

export enum TipoConcepto {
    ENVIO = "envio",
    MENAJE = "menaje",
    ENA = "ena"
}

export interface Bulto {
    id:         number;
    concepto:   number;
    sisgerCode: string;
    indice:     number;
    dentro:     boolean;
    pared:      null;
    mercancia:  Mercancia[];
}

export interface Mercancia {
    id:                number;
    bulto:             number;
    fechaCreacion:     Date;
    descripcion:       string;
    cantidad:          number;
    volumenM3:         number;
    pesoKg:            number;
    pesoLb:            number;
    relacion:          number;
    arancel:           number;
    tarifa:            null;
    alturaCm:          number;
    anchoCm:           number;
    profundidadCm:     number;
    tarifaAlternativa: null;
    miRelacionada:     null;
    other_mercancia:   any[];
}

export interface Consignado {
    id:           number;
    firstName:    string;
    lastName:     string;
    passport:     string;
    dni:          string;
    address:      string;
    municipality: string;
    province:     string;
    country:      string;
    email:        string;
    phones:       string;
    cell:         string;
}

export interface Remitente {
    id:              number;
    remitenteNombre: string;
    remitenteCedula: string;
}
 