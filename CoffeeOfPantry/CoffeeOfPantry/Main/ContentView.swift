//
//  ContentView.swift
//  CoffeeOfPantry
//
//  Created by Allicia Viona Sagi on 08/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                if OrderViewModel.shared.orderList.isEmpty {
                    Text("No orders have been placed.")
                } else {
                    List(OrderViewModel.shared.orderList) { order in
                        OrderCell(name: order.name, coffeeType: order.coffeeType, qty: order.quantity)
                    }
                }
                
            }
            .padding()
            .toolbar {
                Button {
                    OrderViewModel.shared.addOrder(name: "John Doe", coffeeType: "Latte", quantity: 1)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct OrderCell: View {
    
    var name: String
    var coffeeType: String
    var qty: Int

    var body: some View {
        VStack {
            HStack {
                Text("\(coffeeType)")
                Spacer()
                Text("\(qty)x")
            }
            HStack {
                Text("Ordered by \(name)")
                    .font(.footnote)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
