//
//  ViewController.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel de Brito Barros on 17/07/18.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Vars
    var service: LoginService!
    
    //MARK: - UI Elements

    @IBOutlet weak var agendaTelefonica: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var entrarButton: UIButton!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    //MARK: - Life
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.service = LoginService(delegate: self)
        
//Deixar setado para nao ficar digitando toda vez ao entrar
        self.email.text = "joaofelipe@gmail.com"
        self.senha.text = "12345678"
        
        self.agendaTelefonica.image = Asset.agendaTelefonica.image

//Verificar o que significa o L10n...
        self.email.placeholder = L10n.Login.entrar
        self.senha.placeholder = L10n.Login.senha
        
        self.entrarButton.setTitle(L10n.Login.entrar, for: .normal)
        self.entrarButton.setTitleColor(.white, for: .normal)
        self.entrarButton.layer.cornerRadius = self.entrarButton.bounds.height / 2
        self.entrarButton.backgroundColor = .blue
        
        self.cadastrarButton.setTitle(L10n.Login.cadastrar, for: .normal)
        self.cadastrarButton.setTitleColor(.white, for: .normal)
        self.cadastrarButton.layer.cornerRadius = self.cadastrarButton.bounds.height / 2
        self.cadastrarButton.backgroundColor = .blue
    
    }
    
    //MARK: - Actions
    @IBAction func logar(_ sender: Any) {
    
        if let email = self.email.text, let senha = self.senha.text {
            
            self.service.postLogin(email: email, senha: senha)
        } 
    }
}

extension LoginViewController: LoginServiceDelegate {
    
    func postLoginSuccess() {
        self.perform(segue: StoryboardSegue.Main.segueEntrar)
//        self.show(StoryboardScene.Contatos., sender: nil)
    }
    
    func postLoginFailure(error: String) {
        print("Deu ruim!")
        print(error)
    }
}
