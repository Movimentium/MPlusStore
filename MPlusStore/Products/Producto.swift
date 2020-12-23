//
//  Producto.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import Foundation

class Producto: JSONDecodificable {

    let id: String
    let nombre: String
    let descr: String?
    let fecha: Date?
    let strURLimg: String
    let strImgNombre: String
    let strPrecio: String?
    
    var urlImg: URL? {
        return URL(string: strURLimg)
    }
    
    init(id:String, nombre:String, descr:String, fecha:Date, strURLimg:String , strImgNombre:String, strPrecio:String) {
        self.id = id
        self.nombre = nombre
        self.descr = descr
        self.fecha = fecha
        self.strURLimg = strURLimg
        self.strImgNombre =  strImgNombre
        self.strPrecio =  strPrecio
    }
    
    // MARK: - JSONDecodificable
    
    required init(_ decodificador: JSONDecodificador) throws {
        id = try decodificador.valor(paraClave: "id")
        nombre = try decodificador.valor(paraClave: "name")
        strImgNombre = try decodificador.valor(paraClave: "image_title")
        strURLimg = try decodificador.valor(paraClave: "image")
        descr = try? decodificador.valor(paraClave: "description")
        strPrecio = try? decodificador.valor(paraClave: "date")
        fecha = try? decodificador.valor(paraClave: "date")
    }
}

func fakeProducts() -> [Producto] {
  return [
    Producto(id: "1", nombre: "Something1", descr: "Not sure what this does", fecha: Date(), strURLimg: "http://notarealhostname.com/image.png", strImgNombre: "Don't load this URL", strPrecio: "$1.34"),
    Producto(id: "2", nombre: "Bag of Awesome", descr: "All the awesomeness you need in a handy bag", fecha: Date(), strURLimg: "http://imagesrus.com/fakeimage.png", strImgNombre: "Don't load this image URL either", strPrecio: "$234.13"),
    Producto(id: "3", nombre: "Ray of Sunshine", descr: "A single ray of sunshine, moonshine sold separately", fecha: Date(), strURLimg: "http://moarimages.com/sun+moon+happy.png", strImgNombre: "Oh yeah!", strPrecio: "$39.99")
  ]
}
