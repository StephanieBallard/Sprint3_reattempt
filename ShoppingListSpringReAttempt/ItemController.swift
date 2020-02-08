//
//  ItemController.swift
//  ShoppingListSpringReAttempt
//
//  Created by Stephanie Ballard on 2/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//
import UIKit
import Foundation

class ShoppingItemController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingList: [ShoppingItem] = []
    
    var shoppingListURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let shoppingItemsURL = documentsDir.appendingPathComponent("ShoppingList.plist")
        
        return shoppingItemsURL
    }
    
    func update(items: ShoppingItem, name: String, isAdded: Bool) {
        guard let index = shoppingList.firstIndex(of: items) else { return }
        
        var scratch = items
        
        scratch.name = name
        scratch.isAdded = isAdded
        
        
        shoppingList.remove(at: index)
        shoppingList.insert(scratch, at: index)
        
        saveToPersistence()
    }
    
    
    func saveToPersistence() {
        
        guard let fileURL = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            
            let shoppingItemsData = try encoder.encode(shoppingList)
            
            try shoppingItemsData.write(to: fileURL)
            
        } catch {
            print("Error encoding shopping items array: \(shoppingList)")
            
        }
    }
    
    func loadFromPersistence() {
        guard let fileURL = shoppingListURL else { return }
        
        do {
            
            let shoppingItemsData = try Data(contentsOf: fileURL)
            
            let decoder = PropertyListDecoder()
            
            let shoppingListArray = try decoder.decode([ShoppingItem].self, from: shoppingItemsData)
            
            self.shoppingList = shoppingListArray
            
        } catch {
            print("Error decoding medicines: \(error)")
            
        }
    }
    
    func deleteShoppingItem(named item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        shoppingList.remove(at: index)
        
        saveToPersistence()
    }
}
