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
    
    @IBOutlet weak var tableView: UITableView!
    
//inserindo a variavel em que herda os metodos implementados da classe ContatoService:
    var service: ContatoService!
    var serviceLogin: LoginService!
    
//insercao de um vetor de contatos:
    var contatos: [ContatoView] = []
    var delegate: CriarContatoViewControllerDelegate!
    
//metodo que é chamado toda vez que se carrega uma tela:
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Contatos"
        self.title = L10n.Contatos.title
        self.service = ContatoService(delegate: self)
        self.serviceLogin = LoginService(delegate: self)
        self.tableView.register(cellType: ContatoTableViewCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    //Esta funcao atualiza a tela cada vez que for aberta?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.service.getContatos()
    }

    //Deve inserir as? para atualizar --> Esta funcao passa para a tela de detalhe o id do contato selecionado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? CriarContatoViewController {
            
            if let id = sender as? Int {
                
                controller.id = id
                controller.delegate = self
                controller.title = "Editar Contato"
                controller.titleButton = "Atualizar"
                
            } else {
                
                controller.delegate = self
                controller.title = "Criar Contato"
                controller.titleButton = "Cadastrar"
            }
            
        } else if let controller = segue.destination as? DetalharContatoViewController {
            
            if let id = sender as? Int {
                
                controller.id = id
            }
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
    
        let logoutAlert = UIAlertController(title: "Sair", message: "Deseja mesmo sair?", preferredStyle: UIAlertControllerStyle.alert)
        logoutAlert.addAction(UIAlertAction(title: "Cancelar", style: .destructive))
        logoutAlert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { (action: UIAlertAction!) in
        self.serviceLogin.delLogout()
        }))
        
        self.present(logoutAlert, animated: true, completion: nil)
    }
    
    @IBAction func abrirCriar(_ sender: Any) {
        
        self.perform(segue: StoryboardSegue.Contatos.segueCriar)
    }
    
    func atualizar() {
        self.contatos = ContatosViewModel.get()
        self.tableView.reloadData()
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
        let contato: ContatoView = contatos[indexPath.row]
        let editAction = UITableViewRowAction(style: .default, title: "Editar") { (action, indexPath) in
            self.perform(segue: StoryboardSegue.Contatos.segueCriar, sender: self.contatos[indexPath.row].id)
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Excluir") { (action, indexPath) in
            self.deleteAction(contato: contato, indexPath: indexPath)
        }
        deleteAction.backgroundColor = .red
        editAction.backgroundColor = .blue
        return[deleteAction, editAction]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contatos.count
    }
    
//Enviar para a tela de criar contato preenchida.
//    override func editAction(for segue: UIStoryboardSegue, sender: Any?) {
//        if let controller = segue.destination as? CriarContatoViewController {
//            controller.delegate = self
//            if segue.identifier == "segueEditar" {
//            controller.title = "Editar Contato"
//            controller.titleButton = "Atualizar"
//            controller.id = self.id
//            }
//        }
//    }
//        let alert = UIAlertController(title: "Editar", message: "Editar contato", preferredStyle: .alert)
//        let saveAction = UIAlertAction(title: "Salvar", style: .default) { (action) in
//            guard let textField = alert.textFields?.first else {
//                return
//            }
//            if let textToEdit = textField.text {
//                if textToEdit.count == 0 {
//                    return
//                }
//                contato.nome = textToEdit
//                self.tableView?.reloadRows(at: [indexPath], with: .automatic)
//            }else{
//                return
//            }
//        }
//        let cancelAction = UIAlertAction(title: "Cancelar", style: .default)
//        alert.addTextField()
//        guard let textField = alert.textFields?.first else {
//            return
//        }
//        textField.placeholder = "Edite o seu contato"
//        alert.addAction(saveAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true)
//    }
    
    private func deleteAction(contato: ContatoView, indexPath: IndexPath) {
        let contato: ContatoView = contatos[indexPath.row]
        let alert = UIAlertController(title: "Excluir",
                                      message: "Deseja mesmo excluir \(contato.nome) dos seus contatos?",
                                      preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Sim", style: .default) { (action) in
            self.contatos.remove(at: indexPath.row)
            self.tableView?.deleteRows(at: [indexPath], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "Não", style: .default, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
//    configure left buttons
//    cell.leftButtons = [MGSwipeButton(title: "More", icon: UIImage(named:"check.png"), backgroundColor: .green),
//    MGSwipeButton(title: "Favorite", icon: UIImage(named:"fav.png"), backgroundColor: .lightGray)]
//    cell.leftSwipeSettings.transition = .border
//    configure right buttons
//    cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: .red),
//    MGSwipeButton(title: "Edit",backgroundColor: .blue)]
//    cell.rightSwipeSettings.transition = .border
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.perform(segue: StoryboardSegue.Contatos.segueDetalhe, sender: self.contatos[indexPath.row].id)
    }
}

extension ContatosViewController: LoginServiceDelegate {
    
    func delLogoutSuccess() {
        
        if SessionControl.isSessionActive{
            
//Funcao da variavel: quando for para a tela de contatos, a navigation bar poder aparacer,
//pois afirma que a navigation controller sera a tela da tableview
// Vai para a tela de Contatos
            
            let contatosController = UINavigationController(rootViewController: StoryboardScene.Contatos.contatosViewController.instantiate())
            
            self.present(contatosController, animated: true) {
                UIApplication.shared.keyWindow?.rootViewController = contatosController
            }
            
        } else {
            
            // Vai para a tela de Login
            UIApplication.shared.keyWindow?.rootViewController = StoryboardScene.Main.initialScene.instantiate()
        }
    }
    
    func delLogoutFailure(error: String) {
        print(error)
    }
//    func postUserSuccess()
//    func postUserFailure(error: String)
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
