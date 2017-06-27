//
//  familyTreeCell.swift
//  Family Tree
//
//  Created by ben on 27/06/2017.
//  Copyright © 2017 ben. All rights reserved.
//

import UIKit

class familyTreeCell: UITableViewCell {

    @IBOutlet weak var familyStackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func createCurrentGeneration(with familyTree: Json4Swift_Base) {

        let selfView = UIView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        selfView.backgroundColor = UIColor.blue
        familyStackView.addArrangedSubview(selfView)

        drawFamilyCells(members: familyTree.siblings!)

    }

    func createParentGeneration(with parents:[Parents]) {
        drawFamilyCells(members: parents)
    }
    
    func createChildrenGeneration(with children:[Children]) {
        drawFamilyCells(members: children)
    }
    
    func drawFamilyCells<family>(members: Array<family>){
        for member in members {
            var familyCustomView = FamilyView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
            familyCustomView = familyCustomView.instanceFromNib() as! FamilyView

            familyCustomView.backgroundColor = UIColor.orange
            familyStackView.addArrangedSubview(familyCustomView)
            if let parents = member as? Parents {
                familyCustomView.nameLabel.text = parents.name
                
            } else if let children = member as? Children {
                familyCustomView.nameLabel.text = children.name

                
            } else if let siblings = member as? Siblings {
                familyCustomView.nameLabel.text = siblings.name
            }

        }
        
        familyStackView.axis = .horizontal
        familyStackView.distribution = .fillEqually
        familyStackView.alignment = .fill
        familyStackView.spacing = 5
        familyStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
