//
//  ContatoRequestFactory.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import Alamofire

class ContatoRequestFactory {
    
    static func criarContato(nome:String,aniversario:Int,email:String,telefone:String,imagem:String) -> DataRequest {
        
        let parametros: Parameters = ["name":nome,"birth":aniversario,"email":email,"phone":telefone,"picture":imagem]
        
        return Alamofire.request(baseUrl + "contacts", method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: header)
    }

//Listar Contatos
    static func getContatos() -> DataRequest {
        
        return Alamofire.request(baseUrl + "contacts", method: .get, headers: header)
    }

//Deletar Contatos
    static func del(contatoId: Int) -> DataRequest {
        
        return Alamofire.request(baseUrl + "contacts/\(contatoId)", method: .delete, encoding: JSONEncoding.default, headers: header)
    }
    
//Atualizar Contatos
    static func put(contatoId: Int,nome:String,aniversario:Int,email:String,telefone:String,imagem:String) -> DataRequest {
        let parametros: Parameters = ["name":nome,"birth":aniversario,"email":email,"phone":telefone,"picture":imagem]
        
        return Alamofire.request(baseUrl + "contacts/\(contatoId)", method: .put, parameters: parametros, encoding: JSONEncoding.default, headers: header)
        }
}
