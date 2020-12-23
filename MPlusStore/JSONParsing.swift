//
//  JSONParsing.swift
//  MPlusStore
//
//  Created by Miguel on 23/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import Foundation

typealias JSONtipo = [String:Any]

protocol JSONDecodificable {
    init(_ decodificador: JSONDecodificador) throws
}

enum JSONparseoError: Error {
    case faltaLaClave(clave: String)
    case tipoNoCoincidente(clave: String)
}

class JSONDecodificador {
    let jsonObjeto: JSONtipo
    
    init(_ jsonObjeto: JSONtipo) {
        self.jsonObjeto = jsonObjeto
    }
    
    func valor<T>(paraClave clave: String) throws -> T {
        guard let v1 = jsonObjeto[clave] else {
            throw JSONparseoError.faltaLaClave(clave: clave)
        }
        guard let v2 = v1 as? T else {
            throw JSONparseoError.tipoNoCoincidente(clave: clave)
        }
        return v2 
    }
    
    private static let formatoPorDefectoFecha = "dd/MM/yyyy HH:mm:ss"
    private lazy var formateadorFecha = DateFormatter()   // Necesario para String --> Date
    
    func valor(paraClave clave: String, formato: String = JSONDecodificador.formatoPorDefectoFecha) throws -> Date
    {
        let strValor: String = try valor(paraClave: clave)
        formateadorFecha.dateFormat = formato
        if let valorFecha = formateadorFecha.date(from: strValor){
            return valorFecha
        } else {
            throw JSONparseoError.tipoNoCoincidente(clave: clave)
        }
    }
}

func parsear<T>(_ datos: Data) throws -> [T] where T: JSONDecodificable {
    let jsonObjetos: [JSONtipo] = try deserializar(datos)   // 1. Deserializar
    return try jsonObjetos.map(decodificar(_:))             // 2. Decodificar
}

func deserializar(_ datos: Data) throws -> [JSONtipo] {
    let json = try JSONSerialization.jsonObject(with: datos, options: [])
    guard let objetos = json as? [JSONtipo] else {
        return []
    }
    return objetos
}

func decodificar<T>(_ jsonObjeto: JSONtipo) throws -> T where T: JSONDecodificable {
    return try T.init(JSONDecodificador(jsonObjeto))
}

