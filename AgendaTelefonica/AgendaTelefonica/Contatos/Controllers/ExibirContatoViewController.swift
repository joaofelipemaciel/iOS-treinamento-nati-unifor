//
//  DetalharContatoViewController.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel on 01/08/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit

protocol ExibirContatoViewControllerDelegate {
    func atualizar()
}

class ExibirContatoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telefoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    var programVar : Int?
    var contatos: ContatoView!
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.contatos = ContatosViewModel.get(id: id)
        
        if let fooOffset = self.contatos.index(where: {$0.id == programVar}) {
            print(fooOffset)
            self.nameLabel.text = self.contatos[fooOffset].nome
            self.telefoneLabel.text = self.contatos[fooOffset].telefone
            self.emailLabel.text = self.contatos[fooOffset].email
            contactImage.kf.setImage(with: contatos.avatarUrl
            self.contactImage.image = self.contatos[fooOffset].avatarUrl
//            self.birthLabel.text = self.contatos[fooOffset].aniversario
//
//            if let dateFormatterGet =  DateFormatter() {
//            dateFormatterGet.dateFormat = "yyyy-MM-dd"
//
            //            self.imageContato.kf.setImage(with: contato.avatarUrl)
        } else {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
