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

protocol CriarContatoViewControllerDelegate {
    func atualizar()
}

class CriarContatoViewController: UIViewController {

    var contato: Contato?
    var service: ContatoService!
    
    @IBOutlet weak var criarContatoButton: UIButton!
    @IBOutlet weak var nomeContato: UITextField!
    @IBOutlet weak var emailContato: UITextField!
    @IBOutlet weak var telefoneContato: UITextField!
    @IBOutlet weak var imagemContato: UITextField!
    
    var delegate: CriarContatoViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Adicionar contato - botao:
        self.service = ContatoService(delegate: self)
        self.criarContatoButton.setTitle(L10n.Login.cadastrar, for: .normal)
        self.criarContatoButton.layer.cornerRadius = self.criarContatoButton.bounds.height/2
        self.criarContatoButton.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func criarContatoButton(_ sender: Any) {
        //nome, email,telefone,imagem
        if let salvarNome = self.nomeContato.text, let salvarEmail = self.emailContato.text, let salvarTelefone = self.telefoneContato.text, let salvarImagem = self.imagemContato.text {
            
            self.service.postContato(nomeContato: salvarNome, aniversarioContato: 315, emailContato: salvarEmail, telefoneContato: salvarTelefone, imagemContato: salvarImagem)
        }
    }
}



extension CriarContatoViewController: ContatoServiceDelegate {
    
    func getContatosSuccess() {
        print("Contato Salvo")
        
        self.delegate.atualizar()
        self.navigationController?.popViewController(animated: true)
    }
    
    func getContatosFailure(error: String) {
        print(error)
    }
}
