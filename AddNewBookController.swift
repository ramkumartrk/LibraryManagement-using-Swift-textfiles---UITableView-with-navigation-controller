//
//  AddNewBookController.swift
//  LibraryManagementSystem
//
//  Created by Ram Kumar T on 20/01/20.
//  Copyright © 2020 Ram Kumar T. All rights reserved.
//

import UIKit

class AddNewBookController : UIViewController
{
    
    let filename = "data.txt"
    var bookNameStr  : String? = nil
    var authorStr : String? = nil
    var publicationStr : String? = nil
    
    
    let titleLabel : UILabel =
    {
        let label : UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.text = "Add Books!!!"
    
        return label
    }()
    
    let bookNameTextField : UITextField =
    {
        let name : UITextField = UITextField()
        name.placeholder = "Enter BookName : "
        name.textColor = .black
        name.borderStyle = .line
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
  
    
    let authorTextField : UITextField =
    {
        let author : UITextField = UITextField()
        author.borderStyle = .line
        author.translatesAutoresizingMaskIntoConstraints  = false
        author.textColor = .black
        author.placeholder = "Enter AuthorName : "
        return author
    }()
    
    let publicationsTextField : UITextField =
    {
        let publications : UITextField = UITextField()
        publications.textColor = .black
        publications.borderStyle = .line
        publications.translatesAutoresizingMaskIntoConstraints = false
        publications.placeholder = "Enter Publications :"
        return publications
    }()
    
    @objc func addNewBook()
    {
            print("Adding New Book!")
        
        bookNameStr =  bookNameTextField.text
        authorStr = authorTextField.text
        publicationStr = publicationsTextField.text
        print("Book name: " + bookNameStr!)
        print("Author: " + authorStr!)
        print("publication: " + publicationStr!)
        
        
        if(bookNameStr!.contains(";") || bookNameStr == "")
        {
            bookNameStr = nil
            
           
            let alertController = UIAlertController(title: "semicolon Error!", message: "Book Name must contain only alphabets & numerals", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Remove semicolon", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: {
            
                self.bookNameTextField.text = ""
            })
        }
        if(authorStr!.contains(";") || authorStr == "")
        {
            authorStr = nil
            let alertController = UIAlertController(title: "Semicolon Error!", message: "Author Name must contain only alphabets & numerals", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Remove semicolon", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion:
                {
                   
                    self.authorTextField.text = ""
            })
            
        }
        if(publicationStr!.contains(";") || publicationStr == "")
        {
             publicationStr = nil
            let alertController = UIAlertController(title: "Semicolon Error!", message: "Publication name must contain only alphabets & numerals", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Remove semicolon", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion:
                {
                    
                    self.publicationsTextField.text = ""
            })
            
        }
        else
        {
            
            
            
            var bookDetails = bookNameStr! + ";" + authorStr! + ";" + publicationStr!
            print("BookDetails:" + bookDetails)
            
            let alertController = UIAlertController(title: "Successfully saved", message: "Book details stored!", preferredStyle: .alert)
            let alertAction  = UIAlertAction(title: "stored!", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController,animated: true, completion:
                {
                    self.bookNameTextField.text = ""
                    self.authorTextField.text = ""
                    self.publicationsTextField.text = ""
                    
            })
        }
    }
    
    let addButton  : UIButton =
    {
        let addButton : UIButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.backgroundColor = .systemBlue
        addButton.titleShadowColor(for: .normal)
        addButton.titleColor(for: .normal)
        
        
        addButton.setTitle("Add Book", for: .normal)
        addButton.addTarget(self, action: #selector(addNewBook), for: .touchUpInside)
        return addButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Add New Book Controller!")
        view.backgroundColor = UIColor.yellow
        
        view.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
               titleLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
               titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
               titleLabel.centerXAnchor.constraint(equalTo : view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        view.addSubview(bookNameTextField)
        bookNameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        bookNameTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        bookNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        bookNameTextField.centerXAnchor.constraint(equalTo : view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        view.addSubview(authorTextField)
        authorTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        authorTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        authorTextField.topAnchor.constraint(equalTo: bookNameTextField.bottomAnchor, constant: 30).isActive = true
                authorTextField.centerXAnchor.constraint(equalTo : view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        view.addSubview(publicationsTextField)
        publicationsTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        publicationsTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        publicationsTextField.topAnchor.constraint(equalTo: authorTextField.bottomAnchor, constant: 30).isActive = true
                publicationsTextField.centerXAnchor.constraint(equalTo : view.safeAreaLayoutGuide.centerXAnchor).isActive = true
       
        view.addSubview(addButton)
        
        addButton.widthAnchor.constraint(equalTo : view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
        addButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: publicationsTextField.bottomAnchor, constant: 30).isActive = true
        

    }
    
}
