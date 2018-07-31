//
//  ContatoTableViewCell.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel on 30/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class ContatoTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var contatoImagem: UIImageView!
    @IBOutlet weak var descricaoFoto: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func bind(contato: ContatoView) {
        
        self.descricaoFoto.text = contato.nome
//        self.contatoImagem.kf.setImage(with: contato.avatarUrl)
    }
    
}
