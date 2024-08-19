//
//  DessertIslandTests.swift
//  DessertIslandTests
//
//  Created by Chris Nielubowicz on 8/12/24.
//

import XCTest
@testable import DessertIsland

final class MealInstructionTests: XCTestCase {
    func testEmptyInstruction() {
        let viewModel = MealInstructionViewModel(instructions: MealInstructions.test)
        let instructionsList = viewModel.instructionList()
        XCTAssertEqual(instructionsList.count, 4)
        XCTAssertEqual(instructionsList.first!, "     1. First instruction.")
        XCTAssertEqual(instructionsList.last!, "     4. Fourth Instruction.")
    }
    
    func testNilMeasurement() {
        let viewModel = MealInstructionIngredientViewModel(instructions: MealInstructions.test)
        let ingredientList = viewModel.ingredientsList()
        XCTAssertEqual(ingredientList.count, 2)
        XCTAssertEqual(ingredientList.first!, "• 1 cup An Ingredient")
        XCTAssertEqual(ingredientList.last!, "• 1 tbsp A second ingredient")
    }
}

extension MealList {
    static var test = MealList(meals: [Meal.test, Meal.test, Meal.test])
}

extension Meal {
    static var test = Meal(name: "Test Meal", thumbnail: "http://notathumb", id: "1234")
}

extension MealLookup {
    static var test = MealLookup(meals: [MealInstructions.test])
}

extension MealInstructions {
    static var test = MealInstructions(
        id: "1234",
        name: "Test Meal",
        drinkAlternate: nil,
        category: "Dessert",
        area: "Here",
        instructions: "First instruction.\r\nSecond instruction.\r\nThird Instruction. \r\n\r\nFourth Instruction.",
        thumbnail: "http://notathumb",
        tags: nil,
        youtubeLink: "http://notayoutube",
        ingredient1: "An Ingredient",
        ingredient2: nil,
        ingredient3: "A second ingredient",
        ingredient4: nil,
        ingredient5: nil,
        ingredient6: nil,
        ingredient7: nil,
        ingredient8: nil,
        ingredient9: nil,
        ingredient10: nil,
        ingredient11: nil,
        ingredient12: nil,
        ingredient13: nil,
        ingredient14: nil,
        ingredient15: nil,
        ingredient16: nil,
        ingredient17: nil,
        ingredient18: nil,
        ingredient19: nil,
        ingredient20: nil,
        measure1: "1 cup",
        measure2: "40 oz",
        measure3: "1 tbsp",
        measure4: nil,
        measure5: nil,
        measure6: nil,
        measure7: nil,
        measure8: nil,
        measure9: nil,
        measure10: nil,
        measure11: nil,
        measure12: nil,
        measure13: nil,
        measure14: nil,
        measure15: nil,
        measure16: nil,
        measure17: nil,
        measure18: nil,
        measure19: nil,
        measure20: nil,
        source: nil,
        imageSource: nil,
        creativeCommons: nil,
        dateModified: nil
    )
}
