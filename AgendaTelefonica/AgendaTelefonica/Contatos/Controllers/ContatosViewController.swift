//
//  ContatosViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import Foundation
import UIKit
import Reusable
import Kingfisher
import SVProgressHUD

class ContatosViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var service: ContatoService!
    
    var contatos: [ContatoView] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contatos"
        self.title = L10n.Contatos.title
        self.service = ContatoService(delegate: self)
        self.tableView.register(cellType: ContatoTableViewCell.self)
        self.service.getContatos()
        
        
    }
}

extension ContatosViewController: ContatoServiceDelegate {
    
    func getContatosSuccess() {
        
        self.contatos = ContatosViewModel.get()
        self.tableView.reloadData()
        
//        for contato in ContatosViewModel.get() {
//           print(contato.nome)
//        }
    }
    
    func getContatosFailure(error: String) {
        print(error)
    }
}

extension ContatosViewController: UITableViewDelegate, UITableViewDataSource {
  
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.contatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath) as ContatoTableViewCell
        
        cell.bind(contato: self.contatos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
}


