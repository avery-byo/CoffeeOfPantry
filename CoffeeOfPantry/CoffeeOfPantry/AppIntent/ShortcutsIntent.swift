//
//  ShortcutsIntent.swift
//  AppIntent
//
//  Created by Delvina J on 20/04/25.
//

import AppIntents

// MARK: -- Your Item
enum CoffeeType: String, AppEnum {
    case latte, cappuccino, macchiato
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        "Coffee Type"
    }

    static var caseDisplayRepresentations: [CoffeeType : DisplayRepresentation] {
        [
            .latte: "Latte",
            .cappuccino: "Cappuccino",
            .macchiato: "Macchiato"
        ]
    }
}


// MARK: -- Step 2: Make Your App Intent Accessible in Your Device Here
struct AppIntentShortcutProvider: AppShortcutsProvider {
    
    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: OrderCoffee(),
                    phrases: ["Order coffee in \(.applicationName)"]
                    ,shortTitle: "Order Coffee", systemImageName: "cup.and.saucer.fill")
        
        AppShortcut(intent: OrderCappuccino(),
                    phrases: ["Order a cappuccino in \(.applicationName)"]
                    ,shortTitle: "Order Cappuccino", systemImageName: "cup.and.saucer.fill")
        
        AppShortcut(intent: YourOwnAction(),
                    phrases: ["My Own Action in \(.applicationName)"]
                    ,shortTitle: "Own Action", systemImageName: "heart.fill")
        
    }
    
}


// MARK: -- Step 1: Create Your App Intent Here
struct OrderCoffee: AppIntent {
    
    @Parameter(title: "Coffee Type") var coffeeType: CoffeeType
    @Parameter(title: "Quantity") var quantity: Int
    @Parameter(title: "Your Name") var name: String
    
    static var title: LocalizedStringResource = LocalizedStringResource("Order Coffee")
    
    func perform() async throws -> some IntentResult {
        print("Selected Coffee Type: \(coffeeType)")
        OrderViewModel.shared.addOrder(name: name, coffeeType: coffeeType.rawValue.capitalized, quantity: quantity)
        print(OrderViewModel.shared.orderList)
        return .result()
    }
}

struct OrderCappuccino: AppIntent {
    
    @Parameter(title: "Quantity") var quantity: Int
    @Parameter(title: "Your Name") var name: String

    static var title: LocalizedStringResource = LocalizedStringResource("Order Cappuccino")
    
    func perform() async throws -> some IntentResult {
        OrderViewModel.shared.addOrder(name: name, coffeeType: "Cappuccino", quantity: quantity)
        return .result()
    }
    
}

// MARK: -- Customize Your Own
struct YourOwnAction: AppIntent {
    
    @Parameter(title: "Your Parameter") var parameter1: Int
    @Parameter(title: "Your Parameter") var parameter2: String

    static var title: LocalizedStringResource = LocalizedStringResource("Your Own")
    
    func perform() async throws -> some IntentResult {
        print("this is your input, parameter1: \(parameter1), parameter2: \(parameter2)")
        return .result()
    }
    
}

