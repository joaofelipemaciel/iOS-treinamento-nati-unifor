//
//  MatriculaCounter.swift
//  DelegateExample
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import Reusable

protocol MatriculaCounterDataSource {

    func numberOfLabel() -> Int
    func colorOfText() -> UIColor
}

protocol  MatriculaCounterDelegate {
    
    func didSelect()
}

class MatriculaCounter: UIView, NibOwnerLoadable {

    @IBOutlet weak var labelCounter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configure()
        self.loadNibContent()
    }
    
    //MARK: General Functions
    private func configure(){
    
        let gesture = UITapGestureRecognizer(target: self, action: #selector(MatriculaCounter.didSelectView))
    self.addGestureRecognizer(gesture)
    }
    
    //MARK: - Vars
    var dataSource: MatriculaCounterDataSource?
    var delegate: MatriculaCounterDelegate?
    
    func  reloadData() {
     
        self.labelCounter.text = "Matriculados: \(self.dataSource?.numberOfLabel() ?? 0)"
        self.labelCounter.textColor = self.dataSource?.colorOfText()
    }
    
    //MARK: - Actions
    @objc func didSelectView() {
        
        self.delegate?.didSelect()
    }
}
