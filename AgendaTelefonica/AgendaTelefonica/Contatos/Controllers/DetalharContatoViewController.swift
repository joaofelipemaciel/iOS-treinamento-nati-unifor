//
//  DetalharContatoViewController.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel on 01/08/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit
import RealmSwift
import Foundation
import Reusable
import Kingfisher
import SVProgressHUD

class DetalharContatoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telefoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
//    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var editarButton: UIButton!
    
    @IBOutlet weak var excluirButton: UIButton!
    
    var programVar: Int?
    var service: ContatoService!
    var contato: ContatoView!
    var id: Int = 0
    var delegate: CriarContatoViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = ContatoService(delegate: self)
        self.contato = ContatosViewModel.get(id: id)
        self.title = "\(contato.nome)"
        self.nameLabel.text = contato.nome
        self.emailLabel.text = contato.email
        self.telefoneLabel.text = contato.telefone
        if let url = contato.avatarUrl {
            contactImage.kf.setImage(with: url)
        }
        nameLabel.isEnabled = false
        emailLabel.isEnabled = false
        telefoneLabel.isEnabled = false
        let editarButton = UIBarButtonItem(title: L10n.Contatos.editar, style: .plain, target: self, action: #selector(DetalharContatoViewController.editarContato))
        self.navigationItem.rightBarButtonItem = editarButton
        self.excluirButton.setTitle(L10n.Contatos.excluir, for: .normal)
        self.excluirButton.layer.cornerRadius = self.excluirButton.bounds.height / 2
        self.excluirButton.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
    }
    
    @objc func editarContato() {
        self.perform(segue: StoryboardSegue.Contatos.segueEditar)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CriarContatoViewController {
            controller.delegate = self
            if segue.identifier == "segueEditar" {
            controller.title = "Editar Contato"
            controller.titleButton = "Atualizar"
            controller.id = self.id
            }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.contato = ContatosViewModel.get(id: id)
        self.title = self.contato.nome
        self.nameLabel.text = self.contato.nome
        self.telefoneLabel.text = self.contato.telefone
        self.emailLabel.text = self.contato.email
        self.contactImage.kf.setImage(with: self.contato.avatarUrl)
//        self.birthLabel.text = self.contato.aniversario
//        if let birthLabel =  DateFormatter() {
//            dateFormatterGet.dateFormat = "yyyy-MM-dd"
    }

    @IBAction func excluirContato(_ sender: Any) {
        self.service.delContato(id: id)
    }
    
}
//
//func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//@IBAction func abrirCriar(_ sender: Any) {
//    self.perform(segue: StoryboardSegue.Contatos.segueCriar)
//}

extension DetalharContatoViewController: ContatoServiceDelegate {
    func getContatosSuccess() {
        
        
    }
    
    func getContatosFailure(error: String) {
        print("Errooo")
        
        let alert = UIAlertController(title: "Contato Excluido", message: "O contato \(self.nameLabel.text!) foi excluído com sucesso", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction.init(title: "Ok!", style: UIAlertActionStyle.default) { (_) in
            
            self.delegate.atualizar()
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func putContatosFailure(error: String) {
        print(error)
    }
    
    func delContatosFailure(error: String) {
        print(error)
        let alert = UIAlertController(title: "Contato Excluido", message: "O contato \(self.nameLabel.text!) foi excluído com sucesso", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func delContatosSuccess() {
        let alert = UIAlertController(title: "Contato Excluido", message: "O contato \(self.nameLabel.text!) foi excluído com sucesso", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction.init(title: "Ok!", style: UIAlertActionStyle.default) { (_) in
            
            self.delegate.atualizar()
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func postContatosFailure(error: String) {
        print(error)
    } 

}

extension DetalharContatoViewController: CriarContatoViewControllerDelegate {
    func atualizar() {
        
    }
}
