//
//  Post.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import Foundation

class Post {
    let id: String
    let title: String
    let content: String
    let date: Date
    
    init(id:String, title:String, content:String, date:Date) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
    }
}

func fakePosts() -> [Post] {
    return [
        Post(id: "1", title: "Store Now Open", content: "Come and see our awesome store!", date: Date())
    ]
}
