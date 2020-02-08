//
//  ShoppingItemCollectionViewCell.swift
//  ShoppingListSpringReAttempt
//
//  Created by Stephanie Ballard on 2/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var isAddedLabel: UILabel!
    
    var shoppingItem: ShoppingItem?
    {
        didSet
        {
            updateViews()
        }
    }
    
    func updateViews()
    {
        if let item = shoppingItem
        {
            itemImageView.image = UIImage(named: item.name)
            itemNameLabel.text = item.name
            
            if item.isAdded {
                isAddedLabel.text = "Added"
            }
            else
            {
                isAddedLabel.text = "Not Added"
            }
        }
    }
    
}
