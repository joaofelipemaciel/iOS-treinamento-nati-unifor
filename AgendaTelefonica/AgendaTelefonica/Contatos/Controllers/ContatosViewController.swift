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



class ContatosViewController: UIViewController, CriarContatoViewControllerDelegate, ExibirContatoViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
//inserindo a veravel em que herda os metodos implementados da classe ContatoService:
    var service: ContatoService!
    
//insercao de um vetor de contatos:
    var contatos: [ContatoView] = []
    var selectedContact: Int = 0
  
//metodo que é chamado toda vez que se carrega uma tela:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contatos"
        self.title = L10n.Contatos.title
        self.service = ContatoService(delegate: self)
        self.tableView.register(cellType: ContatoTableViewCell.self)
        self.service.getContatos()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    @IBAction func abrirCriar(_ sender: Any) {

        self.perform(segue: StoryboardSegue.Contatos.segueCriar)
    }
    
//Deve inserir as? para atualizar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? CriarContatoViewController {
            controller.delegate = self
        }
        
        if let controller = segue.destination as? ExibirContatoViewController{
            controller.programVar = self.selectedContact
        }
    }
    
    func atualizar() {
        
        self.contatos = ContatosViewModel.get()
        
        self.tableView.reloadData()
    }
}


extension ContatosViewController: ContatoServiceDelegate {
    
    func getContatosSuccess() {
        
        self.contatos = ContatosViewModel.get()
        self.tableView.reloadData()
        
        
    }
    
    func getContatosFailure(error: String) {
        print("Erro!")
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedContact = self.contatos[indexPath.row].id!
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.perform(segue: StoryboardSegue.Contatos.segueDetalhe)
    }
    
}


