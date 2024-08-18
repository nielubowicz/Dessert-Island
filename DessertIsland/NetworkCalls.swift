//
//  NetworkCalls.swift
//  DessertIsland
//
//  Created by Chris Nielubowicz on 8/12/24.
//

import SwiftUI

// TODO: Errors could and should be expanded.
enum NetworkError: Error {
    case noResponse
    case status(code: Int)
    case badURL
}


class NetworkCall: ObservableObject {
    private static var _shared = NetworkCall()
    static var shared: NetworkCall {
        get
        {
            return _shared
        }
    }
    
    func getMealsOfType(_ category: String) async throws -> Result<MealList, Error> {
        guard let url = URL(for: .list(category: category)) else { return .failure(NetworkError.badURL) }
        let URLRequest = URLRequest(url: url)
        
        // Make request
        let (data, response) = try await URLSession.shared.data(for: URLRequest)
        
        // Validate response
        guard let response = response as? HTTPURLResponse else { return .failure(NetworkError.noResponse) }
        guard response.statusCode == 200 else { throw NetworkError.status(code: response.statusCode) } // TODO: genericize this call to handle more types of status codes
        
        return .success(try JSONDecoder().decode(MealList.self, from: data))
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
