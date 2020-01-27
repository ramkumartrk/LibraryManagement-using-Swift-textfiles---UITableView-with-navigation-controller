//
//  AllBooksViewController.swift
//  LibraryManagementSystem
//
//  Created by Ram Kumar T on 20/01/20.
//  Copyright © 2020 Ram Kumar T. All rights reserved.
//

import UIKit

struct BookDetails
{
    var bookName : String
    var authorName : String
    var publicationName : String
}



class AllBooksViewController : UITableViewController
{
    
      var Books = [] as [BookDetails];
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableView.register(MyAllBooksCell.self, forCellReuseIdentifier: "CellId")
        
        
        do
        {
       
        
        var fileManager = FileManager.default
        var directory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            directory = directory.appendingPathComponent("outputfile").appendingPathExtension("txt")
            let file = FileHandle.init(forReadingAtPath: directory.path)
            
           if !fileManager.fileExists(atPath: directory.path)
            {
                
              print("Resource text file is missing! please check it out!")
                
            }
            
            else
           {
            
            print("File is yet to read!")
            let data = try String(contentsOf: directory, encoding: String.Encoding.utf8)
        
            let seperatedByNewLines = data.components(separatedBy: .newlines)

            print("seperatedByNewLines: \(seperatedByNewLines)")

          
            
            for seperatedByNewLine in seperatedByNewLines
            {
               var booksDetails =  seperatedByNewLine.split(separator: ";")
                    
                Books.append(BookDetails(bookName: String(booksDetails[0]), authorName: String(booksDetails[1]), publicationName: String(booksDetails[2])))
                
                
                print("booksDetails[0] \(booksDetails[0])")
                print("booksDetails[1] \(booksDetails[1])")
                print("booksDetails[2] \(booksDetails[2])")
            }
            
            print("Whole Books: \(Books)")
          
            
            }
        }
        catch let error as NSError
        {
            print("Error in reading contents of file! \(error)")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! MyAllBooksCell
        
        cell.bookLabel.text = "Book:   " + Books[indexPath.row].bookName
        cell.authorLabel.text = "Author:   " + Books[indexPath.row].authorName
        cell.publicationLabel.text  = "Publication: " + Books[indexPath.row].publicationName
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
}

class MyAllBooksCell : UITableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style : style, reuseIdentifier :  reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bookLabel : UILabel =
    {
        let bookLabel : UILabel = UILabel()
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.text = "Book Names"
        return bookLabel
    }()
    
    let authorLabel : UILabel =
    {
        let authorLabel : UILabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.text = "Author Names"
        return authorLabel
        
    }()
    
    let publicationLabel : UILabel =
    {
        let publicationLabel : UILabel = UILabel()
        publicationLabel.translatesAutoresizingMaskIntoConstraints = false
        publicationLabel.text = "Publication Name"
        return publicationLabel
        
    }()
    
    let bookDetailDisplayView :  UIView =
    {
        let bookDetailDisplayView : UIView = UIView()
        bookDetailDisplayView.translatesAutoresizingMaskIntoConstraints = false
        bookDetailDisplayView.backgroundColor = UIColor.green
        return bookDetailDisplayView
    }()
    
    func setUpViews()
    {
        print("set Up Views")
        
        contentView.addSubview(bookDetailDisplayView)
        bookDetailDisplayView.widthAnchor.constraint(equalTo : contentView.safeAreaLayoutGuide.widthAnchor).isActive = true
        bookDetailDisplayView.heightAnchor.constraint(equalTo : contentView.safeAreaLayoutGuide.heightAnchor).isActive = true
        bookDetailDisplayView.leadingAnchor.constraint(equalTo : contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bookDetailDisplayView.bottomAnchor.constraint(equalTo : contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        bookDetailDisplayView.addSubview(bookLabel)
        bookLabel.widthAnchor.constraint(equalTo : bookDetailDisplayView.safeAreaLayoutGuide.widthAnchor).isActive = true
        bookLabel.heightAnchor.constraint(equalTo: bookDetailDisplayView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo :  bookDetailDisplayView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        
        bookDetailDisplayView.addSubview(authorLabel)
         authorLabel.bottomAnchor.constraint(equalTo : bookDetailDisplayView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        authorLabel.widthAnchor.constraint(equalTo :  bookDetailDisplayView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        authorLabel.heightAnchor.constraint(equalTo : bookDetailDisplayView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
       
        authorLabel.leadingAnchor.constraint(equalTo : bookDetailDisplayView.safeAreaLayoutGuide.leadingAnchor).isActive = true


        bookDetailDisplayView.addSubview(publicationLabel)

        publicationLabel.widthAnchor.constraint(equalTo :  bookDetailDisplayView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        publicationLabel.heightAnchor.constraint(equalTo : bookDetailDisplayView.safeAreaLayoutGuide.heightAnchor, multiplier :0.5).isActive = true
        publicationLabel.leadingAnchor.constraint(equalTo : authorLabel.safeAreaLayoutGuide.trailingAnchor).isActive = true
        publicationLabel.bottomAnchor.constraint(equalTo : bookDetailDisplayView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    

    
}
