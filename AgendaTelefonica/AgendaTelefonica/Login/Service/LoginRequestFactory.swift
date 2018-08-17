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
        
        let params: Parameters = ["email": email, "password": senha]
        
        return Alamofire.request(baseUrl + "auth/sign_in", method: .post, parameters: params, encoding: JSONEncoding.default)
    }
    
    static func delLogout() -> DataRequest {
        return Alamofire.request(baseUrl + "auth/sign_out", method: .delete, headers: header)
    }
    
    static func postUser(email: String, password: String, passwordConfirmation: String) -> DataRequest {
        
        let params: Parameters = ["email": email, "password": password, "password_confirmation": passwordConfirmation]
        
        return Alamofire.request(baseUrl + "auth", method: .post, parameters: params, encoding: JSONEncoding.default)
    }
    
}
