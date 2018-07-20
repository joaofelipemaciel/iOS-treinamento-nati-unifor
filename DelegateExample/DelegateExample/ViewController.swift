//
//  ViewController.swift
//  DelegateExample
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var matriculadosCounterView: MatriculaCounter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.matriculadosCounterView.dataSource = self
        self.matriculadosCounterView.delegate = self
        self.matriculadosCounterView.reloadData()
    }

}

extension ViewController: MatriculaCounterDataSource, MatriculaCounterDelegate {
  
    func didSelect() {
        print("Tap na Controller")
    }
    
    func colorOfText() -> UIColor {
        
        return .orange
    }
    
    func numberOfLabel() -> Int {
        return 7
    }
    
}
