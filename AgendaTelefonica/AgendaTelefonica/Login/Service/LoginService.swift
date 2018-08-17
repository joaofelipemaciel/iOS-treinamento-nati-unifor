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
    func delLogoutSuccess()
    func delLogoutFailure(error: String)
    func postUserSuccess()
    func postUserFailure(error: String)
}

class LoginService {
    
    var delegate: LoginServiceDelegate
    
    required init(delegate: LoginServiceDelegate) {
        self.delegate = delegate
    }

    func postLogin(email: String, senha: String) {
        //MARK: Dúvidas  - serviço
        LoginRequestFactory.postLogin(email: email, senha: senha).validate().responseObject(keyPath: "data") {(response: DataResponse<User>) in
        
            switch response.result {
            case .success:
                
                if let user = response.result.value {
                    UserViewModel.clear()
                    UserViewModel.save(usuario: user)
                    SessionControl.setHeadersParams(headers: response.response?.allHeaderFields)
                }
                self.delegate.postLoginSuccess()
                
            case .failure(let error):
                self.delegate.postLoginFailure(error: error.localizedDescription)
                print("Deu ruim!")
            }
        }
    }

    func delLogout() {
        LoginRequestFactory.delLogout().validate().responseObject { (response: DataResponse<User>) in
            
            switch response.result {
                
            case .success:
                
                ContatosViewModel.clear()
                UserViewModel.clear()
                
                self.delegate.delLogoutSuccess()
                
            case .failure(let error):
                
                self.delegate.delLogoutFailure(error: error.localizedDescription)
            }
        }
    }
    
    func postUser(email: String, password: String, passwordConfirmation: String) {
        LoginRequestFactory.postUser(email: email, password: password, passwordConfirmation: passwordConfirmation).validate().responseJSON { (response: DataResponse<Any>) in
            
            switch response.result {
                
            case .success:
                
                self.delegate.postUserSuccess()
                
            case .failure(let error):
                
                self.delegate.postUserFailure(error: error.localizedDescription)
            }
        }
    }
}

extension LoginServiceDelegate {
    func postLoginSuccess() {
        fatalError()
    }
    func postLoginFailure(error: String) {
        fatalError()
    }
    func delLogoutSuccess() {
        fatalError()
    }
    func delLogoutFailure(error: String) {
        fatalError()
    }
    func postUserSuccess() {
        fatalError()
    }
    func postUserFailure(error: String) {
        fatalError()
    }
}
