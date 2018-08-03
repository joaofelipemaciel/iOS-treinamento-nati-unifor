//
//  ContatoViewModel.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import Foundation

//Nunca colocar options
struct  ContatoView {
    
    var id: Int?
    var nome: String = ""
    var email: String = ""
    var telefone: String = ""
    var avatar: String = ""
    var aniversario: Date = Date()

    var avatarUrl: URL? {
        
        return URL(string: self.avatar)
    }
    
}

class ContatosViewModel {
    
    static func getAsView(_ contato: Contato?) -> ContatoView {
        
        guard let contato = contato else {
            
            return ContatoView()
        }
        
        var contatoView = ContatoView()
        
        contatoView.id =  contato.id.value
        contatoView.nome = contato.nome ?? ""
        contatoView.email = contato.email ?? ""
        contatoView.avatar = contato.avatar ?? ""
        
        if let aniversario = contato.aniversario.value {
            contatoView.aniversario = Date(timeIntervalSince1970: aniversario)
        }
        
        return contatoView
    }
    
    //Vetor de contatos
    static func getAsView(sequence contatos: [Contato]) -> [ContatoView] {
        
        var contatosView = [ContatoView]()
        
        for contato in contatos {
            
            contatosView.append(self.getAsView(contato))
        }
        
        return contatosView
    }
    
    // MARK: - Realm
    static func save(contatos: [Contato]) {
        
        try! uiRealm.write {
            uiRealm.add(contatos, update: true)
        }
    }
    
    static func clear() {
        
        try! uiRealm.write {
            uiRealm.delete(uiRealm.objects(Contato.self))
        }
    }
    
    static func get() -> [ContatoView] {
        
        let contatosModel = uiRealm.objects(Contato.self)
        
        var contatos: [Contato] = []
        contatos.append(contentsOf: contatosModel)
        
        return self.getAsView(sequence: contatos)
    }
    
    static func get(id: Int) -> ContatoView {
        
        let contatosModel = uiRealm.object(ofType: Contato.self, forPrimaryKey: id)
            
        return getAsView(contatosModel)
        
    }
}
