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
protocol ContatoServiceDelegate {
        
    func getContatosSuccess()
    func getContatosFailure(error: String)
    func postContatosSuccess()
    func postContatosFailure(error: String)
    func delContatosSuccess()
    func delContatosFailure(error: String)
    func putContatosSuccess()
    func putContatosFailure(error: String)

}

extension ContatoServiceDelegate {
    
    func getContatosSuccess() {
        fatalError("Precisa ser implementado")
    }
    func getContatosFailure() {
        fatalError("Precisa ser implementado")
    }
    func postContatosSuccess() {
        fatalError("Precisa ser implementado")
    }
    func postContatosFailure() {
        fatalError("Precisa ser implementado")
    }
    func delContatosSuccess() {
        fatalError("Precisa ser implementado")
    }
    func delContatosFailure() {
        fatalError("Precisa ser implementado")
    }
    func putContatosSuccess() {
        fatalError("Precisa ser implementado")
    }
    func putContatosFailure() {
        fatalError("Precisa ser implementado")
    }
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
    
            self.delegate.postContatosSuccess()
    
        case .failure(let error):
    
            self.delegate.postContatosFailure(error: error.localizedDescription)
            }
        }
    }
    
    func delContato(id: Int) {
        
        ContatoRequestFactory.del(contatoId: id).validate().responseObject { (response: DataResponse<Contato>) in
            
            switch response.result {
                
            case .success:
                
                self.delegate.delContatosSuccess()
                
            case .failure(let error):
                
                self.delegate.delContatosFailure(error: error.localizedDescription)
            }
        }
    }
    
    
    //deixar isso mais bonito passando apenas o objeto contato para esse metodo
    func putContato(id: Int,nomeContato: String, aniversarioContato: Int, emailContato: String, telefoneContato: String, imagemContato: String) {
        
        ContatoRequestFactory.put(contatoId: id,nome: nomeContato, aniversario: aniversarioContato, email: emailContato, telefone: telefoneContato, imagem: imagemContato).validate().responseObject { (response: DataResponse<Contato>) in
        
            switch response.result {
            case .success:
                if let contato = response.result.value {
                    
                    Contato.save(contato: contato)
                }
                self.delegate.putContatosSuccess()
                
            case .failure(let error):
                self.delegate.putContatosFailure(error: error.localizedDescription)
            }
        }
    }
}
