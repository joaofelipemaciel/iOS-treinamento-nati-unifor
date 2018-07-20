//
//  ViewController.swift
//  RealmExemplo
//
//  Created by administrador on 13/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Criar
    @IBOutlet weak var unifor: UIImageView!
    @IBOutlet weak var entrar: UIButton!
    @IBOutlet weak var matricula: UITextField!
    @IBOutlet weak var senha: UITextField!

    //MARK: - Ler
    @IBOutlet weak var imagemFundo: UIImageView!
    @IBOutlet weak var uniforLabel: UILabel!
    
             override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uniforLabel.text = "Unifor Online"
        self.matricula.text = "Matrícula"
        self.senha.text = "Senha"
        self.entrar.setTitle("Entrar", for: .normal)
        self.entrar.setTitle("Entrando", for: .highlighted)
        
    //MARK: - Actions
    @IBAction func entrar (_ sender: UIButton) {
        if let matricula = self.matricula.text, let senha = self.senha.text {
            
            let user = User()
            user.matricula = matricula
            user.senha = senha
            
            try! uiRealm.write{
                uiRealm.add(user)
            }
        }
    }

    @IBAction func ler(_ sender: UIButton) {
 
        if let matricula = self.matriculaRead.text {
            
            if let user = uiRealm.object(ofType: User.self, forPrimaryKey: matricula){
                
                self.matriculaShow.text = user.matricula
                self.senhaShow.text = user.senha
            }
        }
//      let users = uiRealm.objects()
        let users = uiRealm.objects(User.self)
        
        var usersArray: [User] = []
        usersArray.append(contentsOf: users)
        
        for user in usersArray.filter({$0.senha.contains("iOS")}){
            print(user)
        }
    }
}

