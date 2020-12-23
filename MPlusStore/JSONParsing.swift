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

class JSONDecodificador {
    let jsonObjeto: JSONtipo
    init(_ jsonObjeto: JSONtipo) {
        self.jsonObjeto = jsonObjeto
    }
}

func parsear<T>(_ datos: Data) throws -> [T] where T: JSONDecodificable {
    let jsonObjetos: [JSONtipo] = try deserializar(datos)
    return try jsonObjetos.map(decodificar(_:))
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

