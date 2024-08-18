//
//  DessertIslandApp.swift
//  DessertIsland
//
//  Created by mac on 8/12/24.
//

import SwiftUI

@main
struct DessertIslandApp: App {
    var network = NetworkCall()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}

/*
 
 Please read the following guidelines carefully before starting the coding challenge:

 Asynchronous code must be written using Swift Concurrency (async/await).
 
 Be sure to filter out any null or empty values from the API before displaying them.
 UI/UX design is not what you’re being evaluated on, but the app should be user friendly and should take basic app design principles into
 account.
 
 Your project should compile using the latest version of Xcode.
 
 */
