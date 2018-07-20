//
//  ViewController.swift
//  NetworkExample
//
//  Created by administrador on 16/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func alamofireExemploe(_ sender: Any) {
        
        Alamofire.request("https://api.github.com/users/joaofelipemaciel/repos", method: .get).validate().responseArray(completionHandler: { (response:
            DataResponse<[Repo]>) in
            
            switch response.result{
                
            case .success:
                
                if let repos = response.result.value {
                    
                    for repo in repos{
                        
                        print("Nome: \(repo.name ?? "") e foi feito em \(repo.language ?? "")")
                    }
                }
                
            case .failure(let error):
                
                print(error.localizedDescription)
                
            }
        })
    
    }
}
