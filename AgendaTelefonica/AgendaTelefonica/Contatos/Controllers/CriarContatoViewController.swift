//
//  CriarContatoViewController.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel on 31/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import Foundation
import UIKit
import Reusable
import Kingfisher
import SVProgressHUD

class CriarContatoViewController: UIViewController {

    @IBOutlet weak var criarContatoButton: UIButton!
    @IBOutlet weak var nomeContato: UITextField!
    @IBOutlet weak var emailContato: UITextField!
    @IBOutlet weak var telefoneContato: UITextField!
    @IBOutlet weak var imagemContato: UITextField!
    
    var contato: Contato?
    var service:
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CriarContatoViewController: ContatoServiceDelegate {
    func getContatosSuccess() {
        <#code#>
    }
    
    func getContatosFailure(error: String) {
        <#code#>
    }
    

}

