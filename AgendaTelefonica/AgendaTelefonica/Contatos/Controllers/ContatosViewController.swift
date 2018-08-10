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
import MGSwipeTableCell

class ContatosViewController: UIViewController, CriarContatoViewControllerDelegate {
    
    func atualizar() {
        self.contatos = ContatosViewModel.get()
        self.tableView.reloadData()
    }

    @IBOutlet weak var tableView: UITableView!
    @IBAction func abrirCriar(_ sender: Any) {
        self.perform(segue: StoryboardSegue.Contatos.segueCriar)
    }
    
//inserindo a variavel em que herda os metodos implementados da classe ContatoService:
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contatos.count
    }

//Esta funcao atualiza a tela cada vez que for aberta??????????????????
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

extension ContatosViewController: UITableViewDelegate, UITableViewDataSource, MGSwipeTableCellDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ContatoTableViewCell
        let contato: ContatoView = contatos[indexPath.row]
        cell.imageContato.kf.setImage(with: contato.avatarUrl)
        cell.nome.text = contato.nome
        cell.delegate = self //optional
//        cell.bind(contato: self.contatos[indexPath.row])
        return cell
    }
    
    //Delete + Update a cell
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let contato = contatos[indexPath.row]
        let editAction = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            //Call update edition
            self.updateAction(contato: contato, indexPath: indexPath)
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            //Call update edition
            self.deleteAction(contato: contato, indexPath: indexPath)
        }
        deleteAction.backgroundColor = .red
        editAction.backgroundColor = .blue
        return[deleteAction, editAction]
    }
    private func updateAction(contato: Contato, indexPath: IndexPath) {
        
    }
    private func deleteAction(contato: Contato, indexPath: IndexPath) {
        let alert = UIAlertController(title: "Excluir", message: "Deseja mesmo excluir \(self.contatos. text!) foi excluído com sucesso", preferredStyle: <#T##UIAlertControllerStyle#>)
    }
    
    //configure left buttons
    cell.leftButtons = [MGSwipeButton(title: "More", icon: UIImage(named:"check.png"), backgroundColor: .green),
    MGSwipeButton(title: "Favorite", icon: UIImage(named:"fav.png"), backgroundColor: .lightGray)]
    cell.leftSwipeSettings.transition = .border
    
    //configure right buttons
    cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: .red),
    MGSwipeButton(title: "Edit",backgroundColor: .blue)]
    cell.rightSwipeSettings.transition = .border
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.perform(segue: StoryboardSegue.Contatos.segueDetalhe, sender: self.contatos[indexPath.row].id)
    }
}

extension ContatosViewController: ContatoServiceDelegate {
    func getContatosSuccess() {
        self.contatos = ContatosViewModel.get()
        self.tableView.reloadData()
    }
    func getContatosFailure(error: String) {
        print(error)
    }
    func postContatosSuccess() {
        print("O ERRO ERA AQUI")
    }
    func postContatosFailure(error: String) {
        print(error)
    }
    func putContatosSuccess() {
        print("Deu certo aqui...")
    }
    func putContatosFailure(error: String) {
        print(error)
    }
    func delContatosSuccess() {
        print("O contato foi apagado!")
    }
    func delContatosFailure(error: String) {
        print(error)
    }
}
