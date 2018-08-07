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
    var contactForEdit: ContatoView!
    var service: ContatoService!
    var id: Int = 0
    var titleButton: String = ""
    
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
        self.contactForEdit = ContatosViewModel.get(id: id)
        self.criarContatoButton.setTitle(L10n.Login.cadastrar, for: .normal)
        self.criarContatoButton.layer.cornerRadius = self.criarContatoButton.bounds.height/2
        self.criarContatoButton.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.criarContatoButton.setTitle(self.titleButton, for: .normal)
        if id != nil {
            self.nomeContato.text = self.contactForEdit.nome
            self.emailContato.text = self.contactForEdit.email
            self.telefoneContato.text = self.contactForEdit.telefone
            self.imagemContato.text = self.contactForEdit.avatar
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func criarContatoButton(_ sender: Any) {
        //nome, email,telefone,imagem
        if id != 0 {
           //implementar o metodo de put
            self.editarContato()
        } else {
            self.criarContato()
       }
    }
    
    func criarContato(){
        if let salvarNome = self.nomeContato.text, let salvarEmail = self.emailContato.text, let salvarTelefone = self.telefoneContato.text, let salvarImagem = self.imagemContato.text {
            
            self.service.postContato(nomeContato: salvarNome, aniversarioContato: 315, emailContato: salvarEmail, telefoneContato: salvarTelefone, imagemContato: salvarImagem)
        }
    }
    func editarContato(){
        if let salvarNome = self.nomeContato.text, let salvarEmail = self.emailContato.text, let salvarTelefone = self.telefoneContato.text, let salvarImagem = self.imagemContato.text{
        
        self.service.putContato(id: self.id,nomeContato: salvarNome, aniversarioContato: 315, emailContato: salvarEmail, telefoneContato: salvarTelefone, imagemContato: salvarImagem)
        }
    }
    
    func returnToMainViewcontroller() {
        self.delegate.atualizar()
        self.navigationController?.popViewController(animated: true)
    }

}

extension CriarContatoViewController: ContatoServiceDelegate {
    func getContatosSuccess() {
        print("Contato Salvo")
        self.returnToMainViewcontroller()
    }
    
    func postContatosSuccess() {
        print("TERMINEI")
        self.returnToMainViewcontroller()
    }
    
    func getContatosFailure(error: String) {
        print(error)
    }
    
    func putContatosSuccess() {
       print("TA GAMBIARA MAS DEU CERTO")
       self.returnToMainViewcontroller()
    }
    
    func putContatosFailure(error: String) {
        print(error)
    }
    
    func delContatosFailure(error: String) {
        print(error)
    }
    
    func postContatosFailure(error: String) {
        print(error)
    }

}
