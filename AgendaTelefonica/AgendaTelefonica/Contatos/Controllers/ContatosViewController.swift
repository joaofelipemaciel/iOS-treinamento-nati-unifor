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

class ContatosViewController: UIViewController, CriarContatoViewControllerDelegate {
    
    func atualizar() {
        self.contatos = ContatosViewModel.get()
        self.tableView.reloadData()
    }

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func abrirCriar(_ sender: Any) {
        self.perform(segue: StoryboardSegue.Contatos.segueCriar)
    }
    
//inserindo a veravel em que herda os metodos implementados da classe ContatoService:
    var service: ContatoService!
//insercao de um vetor de contatos:
    var contatos: [ContatoView] = []
  
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
    
//Esta funcao atualiza a tela cada vez que for aberta
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.service.getContatos()
    }

    
    //Deve inserir as? para atualizar --> Esta funcao passa para a tela de detalhe o id do contato selecionado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CriarContatoViewController {
            controller.delegate = self
            controller.title = "Criar Contato"
            controller.titleButton = "Cadastrar"
        } else if let controller = segue.destination as? DetalharContatoViewController {
            
            if let id = sender as? Int {
                controller.id = id
            }
            
        }
    }
}

extension ContatosViewController: ContatoServiceDelegate {
    func postContatosSuccess() {
        print("O ERRO ERA AQUI")
    }
    
    
    func putContatosFailure(error: String) {
        print(error)
    }
    
    func postContatosFailure(error: String) {
        print(error)
    }
    
    func delContatosFailure(error: String) {
        print(error)
    }
    
    func getContatosSuccess() {
        self.contatos = ContatosViewModel.get()
        self.tableView.reloadData()
    }
    
    func getContatosFailure(error: String) {
        print(error)
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
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.perform(segue: StoryboardSegue.Contatos.segueDetalhe, sender: self.contatos[indexPath.row].id)
    }
}
