//
//  CoffeeModel.swift
//  CoffeeOfPantry
//
//  Created by Delvina J on 21/04/25.
//

import Foundation

struct OrderModel: Identifiable {
    var id: UUID = UUID()
    var name: String
    var coffeeType: String
    var quantity: Int
}
