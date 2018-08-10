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
import MGSwipeTableCell

class ContatoTableViewCell: MGSwipeTableCell, NibReusable {
    
    let imageContato: UIImageView = {
        let contato = UIImageView(frame: .zero)
        contato.translatesAutoresizingMaskIntoConstraints = false
        return contato
    }()
    
    let nome: UILabel = {
        let nomeLable = UILabel(frame: .zero)
        nomeLable.translatesAutoresizingMaskIntoConstraints = false
        nomeLable.text = "Nome Completo da Pessoa"
        return nomeLable
    }()
   
    override func awakeFromNib() {
        super.awakeFromNib()

        self.addSubview(self.imageContato)
        self.imageContato.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        self.imageContato.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
        self.imageContato.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.imageContato.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        self.imageContato.layer.cornerRadius = self.imageContato.frame.size.width/2
//        self.imageContato.clipsToBounds = true
        
        self.addSubview(self.nome)
        self.nome.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        self.nome.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
        self.nome.leftAnchor.constraint(equalTo: self.imageContato.rightAnchor, constant: 16).isActive = true
        self.nome.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
//        self.nome.layer.borderColor = UIColor.lightGray.cgColor
//        self.nome.layer.borderWidth = 0.5
    }

    func bind(contato: ContatoView) {
        
        self.nome.text = contato.nome
        self.imageContato.kf.setImage(with: contato.avatarUrl)
    }
//    
//extension ContatoTableViewCell: MGSwipeTableCell {
//        
//    }
    
}
