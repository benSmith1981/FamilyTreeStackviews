//
//  FamilyView.swift
//  Family Tree
//
//  Created by ben on 27/06/2017.
//  Copyright © 2017 ben. All rights reserved.
//

import UIKit

class FamilyView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    
    func instanceFromNib() -> UIView {
        return (UINib(nibName: "FamilyView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? FamilyView)!
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
