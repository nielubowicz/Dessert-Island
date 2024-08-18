//
//  MealDetailView.swift
//  DessertIsland
//
//  Created by mac on 8/17/24.
//

import SwiftUI

/*
 When the user selects a meal, they should be taken to a detail view that includes:

 Meal name
 Instructions
 Ingredients/measurements
 */
struct MealDetailView: View {
    @EnvironmentObject var network: NetworkCall
    @Binding var meal: Meal
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer(minLength: 24)
                if let meal = network.mealDetails.meals.first {
                    let printer = MealInstructionIngredientPrinter(instructions: meal)
                    ForEach(Array(printer.ingredientsList().enumerated()), id: \.offset) { _, ingredient in
                        Text(ingredient)
                    }
                    
                    Spacer(minLength: 24)
                    
                    let instructionPrinter = MealInstructionPrinter(instructions: meal)
                    ForEach(Array(instructionPrinter.instructionList().enumerated()), id: \.offset) { _, instruction in
                        Text(instruction)
                        Spacer(minLength: 8)
                    }
                }
                
            }.onAppear {
                network.getMealDetails(for: meal.id)
            }
        }
        .padding(16)
        .navigationTitle(meal.name)
    }
}

#Preview {
    struct Preview: View {
        @State var meal = Meal(name: "Best Dessert", thumbnail: "http://notathumbnail", id: "1234")
        var body: some View {
            MealDetailView(meal: $meal)
                .environmentObject(NetworkCall())
        }
    }
    
    return Preview()
    
}
