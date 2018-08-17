//
//  SessionControl.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//


import Foundation

var header: [String : String] = [:]

//Classe destinada a realizar as "requisicoes", verificando se ha algum usuario logado.
class SessionControl {
    
    static var isSessionActive: Bool {
        
        if let _ = uiRealm.objects(User.self).first {
            return true
        }
        return false
    }
    
    static func setHeadersParams(headers: [AnyHashable : Any]? = nil) {
        
        header = [:]
        
        //refere-se a um IF de forma inversa, caso for nulo, ele entra
        guard let headers = headers else {
            
            //Se nao existir, após entrar na funcao, ele executará esse IF primeiro, ñ necessario passar parametro
            if let user = uiRealm.objects(User.self).first {
                
                header["Content-Type"] = "application/json"
                
                if let accessToken = user.accessToken {
                    header["Access-Token"] = accessToken
                }
                if let client = user.client {
                    header["Client"] = client
                }
                if let uid = user.uid {
                    header["Uid"] = uid
                }
            }
            
            return
        }
        
        UserViewModel.setHeadersParams(headers: headers)
        
        if let accessToken = headers["Access-Token"] as? String {
            header["Access-Token"] = accessToken
        }
        if let client = headers["Client"] as? String {
            header["Client"] = client
        }
        if let uid = headers["Uid"] as? String {
            header["Uid"] = uid
        }
    }
}
