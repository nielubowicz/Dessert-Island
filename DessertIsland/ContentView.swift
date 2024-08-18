//
//  ContentView.swift
//  DessertIsland
//
//  Created by mac on 8/12/24.
//

import SwiftUI

/*
 The user should be shown the list of meals in the Dessert category, sorted alphabetically.
 */
struct ContentView: View {
    @EnvironmentObject var network: NetworkCall
    var body: some View {
        NavigationView {
            List {
                ForEach(network.meals.meals) { meal in
                    RowView(meal: meal)
                }
            }.onAppear {
                network.getMeals()
            }
            .navigationTitle("Dessert Island")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NetworkCall())
}

