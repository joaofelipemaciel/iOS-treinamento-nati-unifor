//
//  ContatoService.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

//protocol -> gera funcoes que devem ser implementadas obrigatoriamente
protocol  ContatoServiceDelegate {
    
    func  getContatosSuccess()
    func getContatosFailure(error: String)
}

class ContatoService {
    
    var delegate: ContatoServiceDelegate
    
    required init(delegate: ContatoServiceDelegate) {
        self.delegate = delegate
    }
    
    func getContatos() {
        
        ContatoRequestFactory.getContatos().validate().responseArray { (response: DataResponse<[Contato]>) in
            
            switch response.result {
                
            case .success:
                
                if let contatos = response.result.value {
                    
                    ContatosViewModel.clear()
                    
                    ContatosViewModel.save(contatos: contatos)
                }
                
                self.delegate.getContatosSuccess()
                
            case .failure(let error):
                
                self.delegate.getContatosFailure(error: error.localizedDescription)
            }
        }
    }
    
    func postContato(nomeContato: String, aniversarioContato: Int, emailContato: String, telefoneContato: String, imagemContato: String){
    
    ContatoRequestFactory.criarContato(nome: nomeContato, aniversario: aniversarioContato, email: emailContato, telefone: telefoneContato, imagem: imagemContato).validate().responseObject { (response: DataResponse<Contato>) in
    
    switch response.result{
    
    case .success:
    
    if let contato = response.result.value{
    
    ContatosViewModel.save(contatos: [contato])
    }
    
    self.delegate.getContatosSuccess()
    
    case .failure(let error):
    
    self.delegate.getContatosFailure(error: error.localizedDescription)
    }
    }
    }
    
}
