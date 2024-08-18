//
//  NetworkCalls.swift
//  DessertIsland
//
//  Created by mac on 8/12/24.
//

import SwiftUI

// TODO: Errors could and should be expanded.
enum NetworkError: Error {
    case noResponse
    case status(code: Int)
    case badURL
}


class NetworkCall: ObservableObject {
    func getMealsOfType(_ category: String) async throws -> MealList {
        guard let url = URL(for: .list(category: category)) else { throw NetworkError.badURL }
        let URLRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest)
        
        guard let response = response as? HTTPURLResponse else { throw NetworkError.noResponse }
        
        // TODO: genericize this call to handle more types of status codes
        guard response.statusCode == 200 else { throw NetworkError.status(code: response.statusCode) }
        return try JSONDecoder().decode(MealList.self, from: data)
    }
    
    func getMealDetails(for mealID: String) async throws -> MealLookup {
        guard let url = URL(for: .detail(mealID: mealID)) else { throw NetworkError.badURL }
        let URLRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest)
        guard let response = response as? HTTPURLResponse else { throw NetworkError.noResponse }
        
        // TODO: genericize this call to handle more types of status codes
        guard response.statusCode == 200 else { throw NetworkError.status(code: response.statusCode) }
        return try JSONDecoder().decode(MealLookup.self, from: data)
    }
}
