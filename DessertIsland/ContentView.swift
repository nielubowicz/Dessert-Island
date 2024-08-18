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
    @State var mealList: Result<MealList, Error>?
    
    var body: some View {
        NavigationView {
            VStack {
                switch mealList {
                case .success(let mealList):
                    List {
                        ForEach(mealList.meals) { meal in
                            RowView(meal: meal)
                        }
                    }
                    
                case .failure(let error):
                    VStack(alignment: .center) {
                        Text(error.localizedDescription)
                    }
                    
                case nil:
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            Color.secondary.opacity(0.6)
                        }
                        .animation(.easeInOut(duration: 2.0), value: mealList != nil)
                    
                }
            }
            .navigationTitle("Dessert Island")
        }
        .task {
            do {
                mealList = try await NetworkCall.shared.getMealsOfType("Dessert")
            } catch {
                // TODO: Handle error
                // TODO: Add an alert with a retry button
            }
        }
    }
}

#Preview {
    ContentView(mealList: .success(MealList(meals: [Meal]() )))
}

#Preview {
    ContentView(mealList: nil)
}
