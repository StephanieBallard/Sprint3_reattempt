//
//  ShoppingItemsCollectionViewController.swift
//  ShoppingListSpringReAttempt
//
//  Created by Stephanie Ballard on 2/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

var itemsController = ShoppingItemController()

class ShoppingItemsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSegueToOrderScreen" {
           if let destination = segue.destination as? OrderViewController {
            destination.shoppingList = itemsController
            }
        }
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsController.shoppingList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {
            return UICollectionViewCell()
        }
    
        let item = itemsController.shoppingList[indexPath.item]
        cell.shoppingItem = item
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
    {
        var item = itemsController.shoppingList[indexPath.item]
        item.isAdded.toggle()
        itemsController.shoppingList[indexPath.item] = item
        itemsController.saveToPersistence()
        collectionView.reloadData()
        return true
    }

}
