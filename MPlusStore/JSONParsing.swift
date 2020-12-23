//
//  JSONParsing.swift
//  MPlusStore
//
//  Created by Miguel on 23/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import Foundation

typealias JSONtipo = [String:Any]

protocol JSONDecodable {
    init(_ decoder: JSONDecodificador) throws
}

class JSONDecodificador {
    let jsonObjeto: JSONtipo
    init(_ jsonObjeto: JSONtipo) {
        self.jsonObjeto = jsonObjeto
    }
}
