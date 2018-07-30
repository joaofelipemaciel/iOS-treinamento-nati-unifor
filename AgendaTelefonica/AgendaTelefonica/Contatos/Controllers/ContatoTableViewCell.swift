//
//  ContatoTableViewCell.swift
//  AgendaTelefonica
//
//  Created by João Felipe Maciel on 30/07/2018.
//  Copyright © 2018 João Felipe Maciel de Brito Barros. All rights reserved.
//

import UIKit

class ContatoTableViewCell: UITableViewCell {

    @IBOutlet weak var homemImagem: UIImageView!
    @IBOutlet weak var descricaoFoto: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
