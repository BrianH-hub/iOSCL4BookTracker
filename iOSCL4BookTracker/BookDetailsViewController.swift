//
//  BookDetailsViewController.swift
//  iOSCL4BookTracker
//
//  Created by RSKACE on 2020-02-13.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController, UITableViewDelegate {

    
    var book : Book?
    
    @IBOutlet weak var imageView: UIImageView!

    
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title of view is set to the title from the recipe
        self.title = book?.title
        // Do any additional setup after loading the view.
        
        getBookDetails()
        
        if let url = URL(string: book!.imageURL),
            let data = try? Data(contentsOf: url)
        {
            imageView?.image = UIImage(data:data)
        }
        
    }
    
    func getBookDetails(){
        isbnLabel.text = book?.isbn
        authorLabel.text = book?.author
        
        if let ratingInt = book?.rating{
            ratingLabel.text = String(ratingInt)
        }
    }
    

    
}

