//
//  ContentView.swift
//  DessertIsland
//
//  Created by Chris Nielubowicz on 8/12/24.
//

import SwiftUI

/*
 The user should be shown the list of meals in the Dessert category, sorted alphabetically.
 */
struct ContentView: View {
    @State var mealList: MealList = MealList(meals: [Meal]() )
    
    var body: some View {
        NavigationView {
            List {
                ForEach(mealList.meals) { meal in
                    RowView(meal: meal)
                }
            }.navigationTitle("Dessert Island")
        }.task {
            do {
                mealList = try await NetworkCall.shared.getMealsOfType("Dessert")
            } catch {
                // TODO: Handle errors here
            }
        }
    }
}

#Preview {
    ContentView()
}

