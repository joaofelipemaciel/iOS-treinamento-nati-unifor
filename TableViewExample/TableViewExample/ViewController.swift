//
//  ViewController.swift
//  TableViewExample
//
//  Created by administrador on 12/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "AppleAndoidTableViewCell", bundle: nil), forCellReuseIdentifier: "cellApple")
    }
}

//MARK: - TableView
    extension ViewController: UITableViewDataSource, UITableViewDelegate{
 
        func numberOfSections(in tableView: UITableView) -> Int {
            return 3
        }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 230
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellApple", for: indexPath) as! AppleAndoidTableViewCell
        
        cell.contentView.backgroundColor = UIColor.brown
        cell.compareLabel.text = "x \(indexPath.row) == \(indexPath.row) x"
        
        return cell
        
    }
}
