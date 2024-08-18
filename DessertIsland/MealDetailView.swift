//
//  MealDetailView.swift
//  DessertIsland
//
//  Created by Chris Nielubowicz on 8/17/24.
//

import SwiftUI

/*
 When the user selects a meal, they should be taken to a detail view that includes:

 Meal name
 Instructions
 Ingredients/measurements
 */
struct MealDetailView: View {
    @Binding var meal: Meal
    @State var mealDetails: MealLookup = MealLookup(meals: [MealInstructions]() )
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer(minLength: 24)
                if let meal = mealDetails.meals.first {
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
                
            }.task {
                do {
                    mealDetails = try await NetworkCall.shared.getMealDetails(for: meal.id)
                } catch {
                    // TODO: Handle errors here
                }
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
        }
    }
    
    return Preview()
    
}
