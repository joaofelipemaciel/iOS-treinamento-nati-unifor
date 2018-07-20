//
//  ViewController.swift
//  Treinamento
//
//  Created by administrador on 11/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTitle: UILabel!
    @IBOutlet weak var matriculaLegend: UILabel!
    @IBOutlet weak var senhaLegend: UILabel!
    @IBOutlet weak var matricula: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var entrar: UIButton!
    @IBOutlet weak var matriculaResult: UILabel!
    @IBOutlet weak var senhaResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginTitle.text = "LOGIN"
        self.matriculaLegend.text = "Entrar com a Matrícula"
        self.senhaLegend.text = "Senha"
        self.matriculaLegend.text = "Matrícula Digitada"
        self.senhaLegend.text = "Senha Digitada"
        self.senha.textContentType = UITextContentType.password
        
        self.entrar.setTitle("Entrar", for: .normal)
        self.entrar.setTitle("Entrando", for: .highlighted)
        self.entrar.backgroundColor = .orange
        self.entrar.layer.cornerRadius = 5
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueDetalhe"{
            
            if let controller = segue.destination as? DetalheViewController {
                controller.matriculaResult.text = self.matricula.text
            }
        } else if segue.identifier == "segueSenha"{
            
            guard let controller = segue.destination as? Detalhe2ViewController else{
            return
            }
            
            controller.senha = self.senha.text
        }
    }
    
    @IBAction func logar( sender: Any){
        
        self.matriculaResult.text = self.matricula.text
        self.senhaResult.text = self.senha.text
        
        self.matricula.text = ""
        self.senha.text = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 10){
            
            self.view.backgroundColor = .red
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


