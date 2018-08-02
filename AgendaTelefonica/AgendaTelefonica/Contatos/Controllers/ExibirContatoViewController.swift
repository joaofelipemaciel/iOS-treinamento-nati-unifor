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
    
    @IBOutlet weak var emailLabel: UILabel!
    var programVar : Int?
    var contatos: [ContatoView] = []

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.contatos = ContatosViewModel.get()
        
        if let fooOffset = self.contatos.index(where: {$0.id == programVar}) {
            print(fooOffset)
            self.nameLabel.text = self.contatos[fooOffset].nome
            self.emailLabel.text = self.contatos[fooOffset].email
            
        } else {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
