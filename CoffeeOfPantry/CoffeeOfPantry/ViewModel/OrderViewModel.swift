//
//  OrderViewModel.swift
//  CoffeeOfPantry
//
//  Created by Delvina J on 21/04/25.
//

import Foundation

// MARK: -- Temporary Persistence
@Observable
class OrderViewModel {
    
    static let shared = OrderViewModel()
    
    var orderList: [OrderModel] = []
    
    func addOrder(name: String, coffeeType: String, quantity: Int) {
        var newOrder = OrderModel(name: name, coffeeType: coffeeType, quantity: quantity)
        OrderViewModel.shared.orderList.append(newOrder)
    }
    
}
