//
//  Book.swift
//  iOSCL4BookTracker
//
//  Created by RSKACE on 2020-02-13.
//  Copyright © 2020 Brian. All rights reserved.
//

import Foundation

class Book
{
    var title: String
    var isbn: String
    var author: String
    var rating: Int
    var imageURL: String
    
    init (title: String, isbn: String, author: String, rating: Int, imageURL: String)
    {
        self.title = title
           self.isbn = isbn
           self.author = author
           self.rating = rating
         self.imageURL = imageURL
    }
}


