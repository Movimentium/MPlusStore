//
//  Product.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import Foundation

struct Product {
    let id: String
    let name: String
    let descr: String
    let date: Date
    let strURLimg: String
    let strImgTitle: String
    let strPrice: String
    
    var urlImg: URL? {
        return URL(string: strURLimg)
    }
}

func fakeProducts() -> [Product] {
  return [
    Product(id: "1", name: "Something1", descr: "Not sure what this does", date: Date(), strURLimg: "http://notarealhostname.com/image.png", strImgTitle: "Don't load this URL", strPrice: "$1.34"),
    Product(id: "2", name: "Bag of Awesome", descr: "All the awesomeness you need in a handy bag", date: Date(), strURLimg: "http://imagesrus.com/fakeimage.png", strImgTitle: "Don't load this image URL either", strPrice: "$234.13"),
    Product(id: "3", name: "Ray of Sunshine", descr: "A single ray of sunshine, moonshine sold separately", date: Date(), strURLimg: "http://moarimages.com/sun+moon+happy.png", strImgTitle: "Oh yeah!", strPrice: "$39.99")
  ]
}
