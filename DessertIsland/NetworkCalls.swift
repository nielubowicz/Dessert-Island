//
//  NetworkCalls.swift
//  DessertIsland
//
//  Created by mac on 8/12/24.
//

import SwiftUI

class NetworkCall: ObservableObject {
    @Published var meals = MealList(meals: [Meal]())
    @Published var mealDetails = MealLookup(meals: [MealInstructions]())
    
    func getMeals() {
        guard let url = URL(for: .list(category: "Dessert")) else { fatalError() }
        let URLRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { fatalError("No data in response: \(response)") }
                DispatchQueue.main.async {
                    do {
                        guard let decodedMeals = try? JSONDecoder().decode(MealList.self, from: data) else { fatalError("Failed to get meals") }
                        self.meals = decodedMeals
                    }
                }
            } else {
                // TODO: Handle failed request
            }
        }
        
        dataTask.resume()
    }
    
    func getMealDetails(for mealID: String) {
        guard let url = URL(for: .detail(mealID: mealID)) else { fatalError() }
        let URLRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: URLRequest) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { fatalError("No data in response: \(response)") }
                DispatchQueue.main.async {
                    do {
                        guard let decodedInstructions = try? JSONDecoder().decode(MealLookup.self, from: data) else { fatalError("Failed to get meal details") }
                        self.mealDetails = decodedInstructions
                    }
                }
            } else {
                // TODO: Handle failed request
            }
        }
        
        dataTask.resume()
    }
}
