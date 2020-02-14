//
//  ViewController.swift
//  iOSCL4BookTracker
//
//  Created by RSKACE on 2020-02-13.
//  Copyright © 2020 Brian. All rights reserved.
//

//13) Assignment
//Create a Book Tracker app. This app shows a listing of books you've read, and shows a detail view of each book and your thoughts about it.
//
//Your app should have the following:
//
//A Book model with the following properties
//Title
//ISBN (10 or 13)
//Author
//Cover Image URL (use Amazon to get cover image urls)
//Your Rating out of 5
//Your Notes (as a String Optional)
//A root view controller that manages a listing (table) of your books. You can hard code the book data (for now until we learn more about persistent storage).
//A detail view controller that manages a detail view of each book. The detail view should show the book cover image, title, isbn, author, your rating and your notes.
//Auto layout is not required for this assignment.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bookTableView: UITableView!
    
  
  // Dummy data
      let books = [
        Book(title: "Jacobs Ladder",
                        isbn:"12345",
                        author:"Bobby Black",
                        rating:5,
                        imageURL: "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg"),
                 
                 Book(title: "Juno",
                 isbn:"6789",
                 author:"John Stewart",
                 rating:3,
                 imageURL: "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg"),
                 
                  Book(title: "Mad Hatter",
                  isbn:"99999",
                  author:"Donald Trump",
                  rating:2,
                  imageURL: "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg")
  ]

      override func viewDidLoad() {
          super.viewDidLoad()

          bookTableView.delegate = self
          bookTableView.dataSource = self
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?){
          /*
           if the dest controller can be cast as a RecipeDetailsViewController and if it can get the index of the tapped row, pass the selected recipe variable in REcipeDetails
           */
          if let bookDetailsViewController = segue.destination as? BookDetailsViewController,
           let index = bookTableView.indexPathForSelectedRow?.row
          {
              bookDetailsViewController.book = books[index]
          }
      }
      

      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return books.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = bookTableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
          
          cell.textLabel?.text = books[indexPath.row].title
          let book = books[indexPath.row]
          
          if let url = URL(string: book.imageURL),
              let data = try? Data(contentsOf: url)
          {
              cell.imageView?.image = UIImage(data:data)
          }
          cell.textLabel?.text = books[indexPath.row].title
          return cell
      }

  }

