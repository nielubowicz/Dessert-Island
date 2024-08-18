//
//  NetworkRequest.swift
//  DessertIsland
//
//  Created by mac on 8/17/24.
//

import Foundation

enum NetworkRequest {
    // TODO: prevent network shenanigans by checking input parameters
    case list(category: String)
    case detail(mealID: String)
}

private let baseURL = URL(string: "https://themealdb.com/api/json/v1/1/")

func URL(for networkRequest: NetworkRequest) -> URL? {
    switch networkRequest {
    case .list(let category):
        return URL(string: "filter.php?c=\(category)", relativeTo: baseURL)
    case .detail(let mealID):
        return URL(string: "lookup.php?i=\(mealID)", relativeTo: baseURL)
    }
}
