//
//  LoginRequestFactory.swift
//  AgendaTelefonica
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import Foundation
import Alamofire

class LoginRequestFactory{
    
    static func postLogin(email: String, senha: String) -> DataRequest {
        
        let param: Parameters = ["email": email, "password": senha]
        
        return Alamofire.request(baseUrl + "auth/sign_in", method: .post, parameters: param, encoding: JSONEncoding.default)
        
    }
}
