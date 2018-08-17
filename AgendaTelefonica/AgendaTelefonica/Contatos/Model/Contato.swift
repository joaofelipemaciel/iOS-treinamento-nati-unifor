//
//  Contato.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//
import Foundation
import RealmSwift
import ObjectMapper

class Contato: Object, Mappable {

    var id  = RealmOptional<Int>()
    @objc dynamic var nome: String?
    @objc dynamic var aniversario: Date? = nil
    @objc dynamic var email: String?
    @objc dynamic var telefone: String?
    @objc dynamic var avatar: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        self.id.value     <- map["id"]
        self.nome         <- map["name"]
        self.aniversario  <- map["birth"]
        self.email        <- map["email"]
        self.telefone     <- map["phone"]
        self.avatar       <- map["picture"]
    }
}

extension Contato {
    
    static func all() -> [Contato] {
        var contatos: [Contato] = []
        let results = uiRealm.objects(Contato.self).sorted(byKeyPath: "nome", ascending: true)
        contatos.append(contentsOf: results)
        return contatos
    }
    
    static func allGrouped() -> [[Contato]] {
        
        let todosContatos = self.all()
        var contatosOrdenados: [[Contato]] = []
        
        let todasIniciais = todosContatos.map({String(describing: $0.nome?.characters.first)})
        var iniciais: [String] = []
        for inicial in todasIniciais {
            if !iniciais.contains(inicial) {
                iniciais.append(inicial)
            }
        }
        
        for inicial in iniciais {
            
            let resultado = todosContatos.filter({String(describing: $0.nome?.characters.first) == inicial})
            if !resultado.isEmpty {
                contatosOrdenados.append(resultado)
            }
        }
        return contatosOrdenados
    }
    
    static func save(contato: Contato) {
        
        try! uiRealm.write {
            uiRealm.add(contato, update: true)
        }
    }
    
    static func saveAll(contatos: [Contato]) {
        
        try! uiRealm.write {
            uiRealm.add(contatos, update: true)
        }
    }
    
    static func delete(id: Int) {
        
        if let contato = uiRealm.object(ofType: Contato.self, forPrimaryKey: id) {
            try! uiRealm.write {
                uiRealm.delete(contato)
            }
        }
    }
    
    static func deleteAll(){
        
        try! uiRealm.write {
            let todosContatos = uiRealm.objects(Contato.self)
            uiRealm.delete(todosContatos)
        }
    }
}
