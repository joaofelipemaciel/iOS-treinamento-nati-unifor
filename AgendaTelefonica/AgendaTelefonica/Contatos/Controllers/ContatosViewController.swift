//
//  ContatosViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit

class ContatosViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var service: ContatoService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contatos"
        self.title = L10n.Contatos.title
        self.service = ContatoService(delegate: self)
        self.service.getContatos()        
    }
}

extension ContatosViewController: ContatoServiceDelegate {
    
    func getContatosSuccess() {
        
        for contato in ContatosViewModel.get() {
            print(contato.nome)
        }
    }
    
    func getContatosFailure(error: String) {
    
    }

}

