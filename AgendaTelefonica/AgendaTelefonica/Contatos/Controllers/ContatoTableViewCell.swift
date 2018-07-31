//
//  ContatoTableViewCell.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel on 30/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit
import Reusable

class ContatoTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var comtatoImagem: UIImageView!
    @IBOutlet weak var descricaoFoto: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func bind(contato: ContatoView) {
        
        self.descricaoFoto.text = contato.nome
    }
    
}
