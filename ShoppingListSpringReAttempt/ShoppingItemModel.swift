//
//  ShoppingItemModel.swift
//  ShoppingListSpringReAttempt
//
//  Created by Stephanie Ballard on 2/7/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Codable, Equatable {
    var name: String
    var isAdded: Bool
}
