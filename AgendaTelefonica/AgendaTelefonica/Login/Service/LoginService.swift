//
//  LoginService.swift
//  AgendaTelefonica
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

protocol LoginServiceDelegate {
    
    func postLoginSuccess()
    func postLoginFailure(error: String)
}

class LoginService {
    
    var delegate: LoginServiceDelegate
    
    required init(delegate: LoginServiceDelegate) {
        self.delegate = delegate
    }

    func postLogin(email: String, senha: String) {
        
        LoginRequestFactory.postLogin(email: email, senha: senha).validate().responseObject(keyPath: "data") {(response: DataResponse<User>) in
        
            switch response.result {
            case .success:
                
                if let user = response.result.value {
                    
                    UserViewModel.clear()
                    
                    UserViewModel.save(usuario: user)
                    
                    SessionControl.setHeadersParams(headers: response.response?.allHeaderFields)
                }
                
            case .failure(let error):
                
                self.delegate.postLoginFailure(error: error.localizedDescription)
            }
        }
    }
}
