//
//  DataModel.swift
//  BooksFind
//
//  Created by herlangga wibi on 01/08/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import Foundation

class ListBook {
    
    var title: String?
    var image: String?
    var author: String?
    var rating: Float?
    var description: String?
    
    
    init() {}
    
    init(title: String, image: String, author: String, rating: Float, description: String) {
        self.title = title
        self.image = image
        self.author = author
        self.rating = rating
        self.description = description
    }
}
