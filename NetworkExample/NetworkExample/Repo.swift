//
//  Repo.swift
//  NetworkExample
//
//  Created by administrador on 16/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import ObjectMapper

class Repo: Mappable {

    var name: String?
    var language: String?
    
    required init?(map: Map) {
        
    }
    
    func  mapping(map: Map) {
        
        name <- map["full_name"]
        language <- map["language"]
    }
    
}
