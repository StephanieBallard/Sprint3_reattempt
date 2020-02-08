//
//  OrderViewController.swift
//  ShoppingListSpringReAttempt
//
//  Created by Stephanie Ballard on 2/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

        
    
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextView: UITextField!
    
    var shoppingList: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews()
    {
        if let shoppingItems = shoppingList
        {
            let orderedItems = shoppingItems.shoppingList.filter({$0.isAdded == true})
            itemsInCartLabel.text = "You currently have \(orderedItems.count) item(s) in your cart."
        }
    }
    
    func alert()
    {
        if let name = nameTextField.text,
            let address = addressTextView.text
        {
            let alert = UIAlertController(title: "Hello, \(name)", message: "Your order will be delivered to \(address).", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func submitOrderButton(_ sender: UIButton) {
        alert()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
