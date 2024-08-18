//
//  RowView.swift
//  DessertIsland
//
//  Created by Chris Nielubowicz on 8/17/24.
//

import SwiftUI

/*
 When the user selects a meal, they should be taken to a detail view
 */

struct RowView: View {
    @State var meal: Meal
    var body: some View {
        NavigationLink(destination: MealDetailView(meal: $meal)) {
            HStack {
                AsyncImage(url: URL(string: meal.thumbnail))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(5)
                    .padding(.leading, 8)
                Text(meal.name)
                    .font(.headline)
                    .lineLimit(2)
                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    RowView(meal: Meal(
        name: "Best Dessert",
        thumbnail: "http://notathumbnail",
        id: "1234")
    )
}
