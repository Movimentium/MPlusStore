//
//  XMLparsing.swift
//  MPlusStore
//
//  Created by Miguel on 26/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import Foundation

enum XMLparseoError: Error {
    case desconocido
}

func parsearXML<T>(_ datos: Data) throws -> [T] where T: JSONDecodificable {
    let parseadorXML = XMLParser(data: datos)
    let delegadoParseadorXML = XMLDecodificador()
    parseadorXML.delegate = delegadoParseadorXML
    if parseadorXML.parse() == false {  // parse() devuelve false si algo ha salido mal
        throw parseadorXML.parserError ?? XMLparseoError.desconocido
    }
    
    let objetos: [JSONtipo] = delegadoParseadorXML.objetosParseados
    return try objetos.map(decodificar(_:))
}

class XMLDecodificador: NSObject, XMLParserDelegate {
    private(set) var objetosParseados: [JSONtipo] = []
    private var dicActual: JSONtipo?
    private var claveActual: String?
    private var valorActual: String?
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        print("parser:didStartElement: \(elementName) >>>")
        if elementName == "product" {
            dicActual = [:]
        } else if elementName != "data" {
            claveActual = elementName
        } else {
            claveActual = nil
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("parser:foundCharacters: \(string)")
        if let _ = claveActual {
            valorActual = string
        } else {
            valorActual = nil
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        print("parser:didEndElement: \(elementName) <<<")
        if elementName == "product", let elDicActual = dicActual {
            objetosParseados.append(elDicActual)
            dicActual = nil
        } else if let laClaveActual = claveActual, let elValorActual = valorActual {
            dicActual?[laClaveActual] = elValorActual
            print("   \(dicActual ?? ["noClaveProducto":"nada"])")
        }
    }
}

//<data>
//  <product>
//      <id>259</id>
//      <name>Raspberry Mineral Water</name>
//      <description>...</description>
//      <image_title>mineral-water-raspberry_600px</image_title>
//      <image>...</image>
//  </product>
// ...
