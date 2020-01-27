//
//  ViewController.swift
//  LibraryManagementSystem
//
//  Created by Ram Kumar T on 17/01/20.
//  Copyright © 2020 Ram Kumar T. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @objc func addNewBookButton()
    {
        print("Add New Book button called from navigation bar item - View Controller")
        self.navigationController?.pushViewController(AddNewBookViewController.init(), animated: true)
    }
    
    var menus = ["All Books", "Books for Rent", "Lent", "Favourites"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("I'mw within Library management system - ViewController.")
        view.backgroundColor = .red
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewBookButton))
        
        self.navigationItem.rightBarButtonItem = add
    
        tableView.register(MyCell.self, forCellReuseIdentifier: "CellId")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! MyCell
        cell.textLabel!.text = menus[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You're selected indexpath: \(indexPath)")
        
        if(indexPath == [0,0])
        {
            self.navigationController?.pushViewController(AllBooksViewController.init(), animated: true)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    


}

class MyCell : UITableViewCell
{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style : style, reuseIdentifier : reuseIdentifier)
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpViews()
    {
        print("SetUpViews")
        contentView.addSubview(textLabel!)
        
    }
}
