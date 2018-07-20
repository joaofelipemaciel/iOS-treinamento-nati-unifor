//
//  Detalhe2ViewController.swift
//  Treinamento
//
//  Created by administrador on 12/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class Detalhe2ViewController: UIViewController {


    @IBOutlet weak var senhaLabel: UILabel!
    
    var senha: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        self.senhaLabel.text = self.senha
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
