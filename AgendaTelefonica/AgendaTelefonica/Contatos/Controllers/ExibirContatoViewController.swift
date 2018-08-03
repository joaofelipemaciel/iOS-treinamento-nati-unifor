//
//  DetalharContatoViewController.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel on 01/08/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit
import RealmSwift

protocol ExibirContatoViewControllerDelegate {
    func atualizar()
}

class ExibirContatoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telefoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var editarButton: UIButton!
    
    @IBOutlet weak var excluirButton: UIButton!
    
    var programVar : Int?
    var service: ContatoService!
    var contato: ContatoView!
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.service = ContatoService(delegate: self)
        
        contato = ContatosViewModel.get(id: id)
        self.title = "\(contato.nome)"
        contactImage.kf.setImage(with: contato.avatarUrl)
        self.nameLabel.text = contato.nome
        self.emailLabel.text = contato.email
        self.telefoneLabel.text = contato.telefone
        
        if let url = contato.avatarUrl {
            
            contactImage.kf.setImage(with: url)
            
        }
        
        self.contactImage.kf.setImage(with: contato.avatarUrl!)
        
        nameLabel.isEnabled = false
        emailLabel.isEnabled = false
        telefoneLabel.isEnabled = false
        
        let editarButton = UIBarButtonItem(title: L10n.Contatos.editar, style: .plain, target: self, action: #selector(ExibirContatoViewController.editar))
        self.navigationItem.rightBarButtonItem = editarButton
        
        self.excluirButton.setTitle(L10n.Contatos.excluir, for: .normal)
        self.excluirButton.layer.cornerRadius = self.excluirButton.bounds.height / 2
        self.excluirButton.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
    
    
    }
    
    @objc func editar() {
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.contato = ContatosViewModel.get(id: id)
        
        self.nameLabel.text = self.contato.nome
        self.telefoneLabel.text = self.contato.telefone
        self.emailLabel.text = self.contato.email
        self.contactImage.kf.setImage(with: self.contato.avatarUrl)
//        self.birthLabel.text = self.contato.aniversario
//        if let birthLabel =  DateFormatter() {
//            dateFormatterGet.dateFormat = "yyyy-MM-dd"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ExibirContatoViewController: ContatoServiceDelegate {
   
   //falta so isso aqui, ve ai pra mim...
   func getContatosSuccess() {
        <#code#>
    }
    
    func getContatosFailure(error: String) {
        print(error)
    }
}
