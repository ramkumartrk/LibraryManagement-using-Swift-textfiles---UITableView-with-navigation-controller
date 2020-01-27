//
//  AddNewBookViewController.swift
//  LibraryManagementSystem
//
//  Created by Ram Kumar T on 21/01/20.
//  Copyright © 2020 Ram Kumar T. All rights reserved.
//

import UIKit
class AddNewBookViewController : UITableViewController
{
    var cell : MyAddNewBookViewControllerCell?;
    var bookDetailsStr : String = ""
    @objc func saveBookDetailsButton()
    {
        
        print("Save books details button")
        var getText : String? = nil
        getText = cell!.sampleTextField.text;
        print("Now we get from textfield is....")
       print(getText!)
        
        var indexPath : IndexPath = IndexPath(row: 0, section: 0)
        let cell1 =  self.tableView.cellForRow(at: indexPath) as? MyAddNewBookViewControllerCell
        getText = cell1?.sampleTextField.text
        print(getText!)
    
        if(getText! == "" || (getText!.contains(";")))
        {
            let alertController = UIAlertController(title: "Nil/Semicolon error", message: "Book Name shouldn't contain ; or shouldn't be empty", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Non-empty", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion:
                {
                    cell1!.sampleTextField.text = ""
            })
        }
        else
        {
            bookDetailsStr += getText! + ";"
        }

        indexPath = IndexPath(row : 1, section : 0)
        let cell2 = self.tableView.cellForRow(at: indexPath) as? MyAddNewBookViewControllerCell
        getText = cell2?.sampleTextField.text
        print(getText!)
        
        if(getText == "" || (getText?.contains(";"))!)
        {
            let alertController = UIAlertController(title: "Nil/Semicolon error", message: "Author Name shouldn't contain ; or shouldn't be empty", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Non-empty", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion:
                {
                    cell2!.sampleTextField.text = ""
            })
        }
        else
               {
                   bookDetailsStr += getText! + ";"
               }

        
        indexPath = IndexPath(row : 2, section : 0)
        let cell3 = self.tableView.cellForRow(at: indexPath) as? MyAddNewBookViewControllerCell
        getText = cell3?.sampleTextField.text
        print(getText!)
        if(getText == "" || (getText?.contains(";"))!)
               {
                   let alertController = UIAlertController(title: "Nil/Semicolon error", message: "Publication Name shouldn't contain ; or shouldn't be empty", preferredStyle: .alert)
                   let alertAction = UIAlertAction(title: "Non-empty", style: .default, handler: nil)
                   alertController.addAction(alertAction)
                   self.present(alertController, animated: true, completion:
                       {
                           cell3!.sampleTextField.text = ""
                   })
               }
        else
               {
                   bookDetailsStr += getText!
               }
       

      
        let outputfile : String = "outputfile"
        
       do
       {
        
        let fileManager = FileManager.default
       // var escapeCharacter : String? = "\n";
//        var str : String?;
       
        
        
        var directory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        directory = directory.appendingPathComponent("outputfile").appendingPathExtension("txt")
        let file = FileHandle.init(forUpdatingAtPath: directory.path)
        if !fileManager.fileExists(atPath: directory.path)
        {
            print("File not exists")
            print("bookDetailsStr : \(bookDetailsStr)")
            let didCreate = FileManager.default.createFile(atPath: directory.path, contents:  bookDetailsStr.data(using: String.Encoding.utf8)!, attributes: nil)
        }
        else
        {
            print("File exists")
            file?.seekToEndOfFile()
             bookDetailsStr = "\n" + bookDetailsStr
            file!.write(bookDetailsStr.data(using: String.Encoding.utf8)!)
        }
        
       // file!.write(escapeCharacter!.data(using : String.Encoding.utf8)!)
        print("Directory path: \(directory.path)")
        print("Hope it is working fine completely!")
       }
        catch let error as NSError
        {
            print("Error caught when storing file... \(error)")
        }
       
        let alertController = UIAlertController(title: "saved!", message: "Books details saved", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Books saved!", style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        })
        alertController.addAction(alertAction)
        self.present(alertController,animated: true,completion:
            {
                cell1?.sampleTextField.text = ""
                cell2?.sampleTextField.text = ""
                cell3?.sampleTextField.text = ""
        })
    
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Add New Book View controller works fine")
        view.backgroundColor = .red
        let saveBookDetail = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveBookDetailsButton))
        self.navigationItem.rightBarButtonItem = saveBookDetail
        self.tableView.register(MyAddNewBookViewControllerCell.self, forCellReuseIdentifier: "Cell1")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
  
    //CellForRowAt
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as! MyAddNewBookViewControllerCell?
        
        if(indexPath == [0,0] || indexPath == [0,1] || indexPath == [0,2])
                    {
                        cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as! MyAddNewBookViewControllerCell?
                        print("Now we're reusing textfield cell")
                    }

        if(cell == nil && (indexPath == [0,0] || indexPath == [0,1] || indexPath == [0,2]))
        {
            cell = MyAddNewBookViewControllerCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell1")
            
            if(indexPath == [0,0])
            {
                cell?.sampleTextField.placeholder = "Book Name..."
            }
            
            else if(indexPath == [0,1])
            {
                cell?.sampleTextField.placeholder = "Author Name..."
            }
                
            else if(indexPath == [0,2])
            {
                cell?.sampleTextField.placeholder = "Publication Name..."
            }
        }
      return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

class MyAddNewBookViewControllerCell : UITableViewCell, UITextFieldDelegate
{
    
    var textSources : [String] = []
    let sampleTextField : UITextField =
    {
        print("I'm within sample Text Field")
        let sampleTextField : UITextField = UITextField()
        sampleTextField.placeholder = "sample text fild"
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.textColor = UIColor.black
        sampleTextField.font = UIFont.systemFont(ofSize: 16)
        return sampleTextField
    }()
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .red
        
    }
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style : style, reuseIdentifier : reuseIdentifier)
        
    if(reuseIdentifier == "Cell1")
    {
            print("ReuseIdentifier - TextField")
        contentView.addSubview(sampleTextField)
       
       
        
        //textFieldDidEndEditing?(sampleTextField)
        
        sampleTextField.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        sampleTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        sampleTextField.heightAnchor.constraint(equalTo : contentView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.75).isActive = true
        sampleTextField.widthAnchor.constraint(equalTo :  contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75).isActive = true
    }
        
//
//    else if(reuseIdentifier == "Cell2")
//    {
//            print("ReuseIdentifier - Button")
//      //  contentView.addSubview(sampleButton)
//
//        sampleButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        sampleButton.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        sampleButton.heightAnchor.constraint(equalTo : contentView.safeAreaLayoutGuide.heightAnchor,multiplier: 0.5).isActive = true
//        sampleButton.widthAnchor.constraint(equalTo : contentView.safeAreaLayoutGuide.widthAnchor,multiplier: 0.5).isActive = true
//    }
        
}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



