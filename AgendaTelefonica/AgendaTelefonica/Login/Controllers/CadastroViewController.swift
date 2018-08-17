//
//  CadastroViewController.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel on 16/08/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {

    //MARK: - Vars
    var service: LoginService!
    
    @IBOutlet weak var nomeCadastro: UITextField!
    @IBOutlet weak var senhaCadastro: UITextField!
    @IBOutlet weak var confirmaSenhaCadastro: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    //MARK: - UI Elements

    override func viewDidLoad() {
        super.viewDidLoad()

        self.service = LoginService(delegate: self as! LoginServiceDelegate)
    }
}
