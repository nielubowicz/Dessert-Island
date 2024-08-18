//
//  ViewModels.swift
//  DessertIsland
//
//  Created by Chris Nielubowicz on 8/18/24.
//

import Foundation

struct MealInstructionIngredientViewModel {
    let instructions: MealInstructions
    
    func ingredientsList() -> [String] {
        [
            (instructions.measure1, instructions.ingredient1),
            (instructions.measure2, instructions.ingredient2),
            (instructions.measure3, instructions.ingredient3),
            (instructions.measure4, instructions.ingredient4),
            (instructions.measure5, instructions.ingredient5),
            (instructions.measure6, instructions.ingredient6),
            (instructions.measure7, instructions.ingredient7),
            (instructions.measure8, instructions.ingredient8),
            (instructions.measure9, instructions.ingredient9),
            (instructions.measure10, instructions.ingredient10),
            (instructions.measure11, instructions.ingredient11),
            (instructions.measure12, instructions.ingredient12),
            (instructions.measure13, instructions.ingredient13),
            (instructions.measure14, instructions.ingredient14),
            (instructions.measure15, instructions.ingredient15),
            (instructions.measure16, instructions.ingredient16),
            (instructions.measure17, instructions.ingredient17),
            (instructions.measure18, instructions.ingredient18),
            (instructions.measure19, instructions.ingredient19),
            (instructions.measure20, instructions.ingredient20),
        ]
        // Filter all measurement and ingredient pairs by isNotNil && isNotEmpty
            .filter({$0.0 != nil && !$0.0!.isEmpty && $0.1 != nil && !$0.1!.isEmpty})
        // Map into a single string with "measurement ingredient"
            .map({"• \($0.0 ?? "") \($0.1 ?? "")"})
    }
}

struct MealInstructionViewModel {
    let instructions: MealInstructions
    
    /*
     Input:
     "strInstructions": "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat..."
     
     Output:
     1. To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.
     2. Roll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.
     3. Preheat...
     */
    func instructionList() -> [String] {
        // Split the string into substrings on \r\n's, turn those back into Strings, then filter out the null ones
        let list = instructions.instructions.split(whereSeparator: { $0 == "\r\n"}).map({String($0)}).compactMap({$0})
        
        // Enumerate the list of instructions to get the instruction's index
        return list.enumerated().map({"     \($0+1). \($1)"})
    }
}
