//
//  NetworkObjects.swift
//  DessertIsland
//
//  Created by Chris Nielubowicz on 8/17/24.
//

import Foundation

/* Example response from filter.php
 {
   "meals": [
     {
       "strMeal": "Apam balik",
       "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
       "idMeal": "53049"
     },
     {
       "strMeal": "Apple & Blackberry Crumble",
       "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
       "idMeal": "52893"
     },
     {
       "strMeal": "Apple Frangipan Tart",
       "strMealThumb": "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
       "idMeal": "52768"
     },
 */
struct MealList: Decodable {
    let meals: [Meal]
}

struct Meal: Identifiable, Decodable {
    let name: String
    let thumbnail: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
}


/* Example response from lookup.php
 {
   "meals": [
     {
       "idMeal": "52767",
       "strMeal": "Bakewell tart",
       "strDrinkAlternate": null,
       "strCategory": "Dessert",
       "strArea": "British",
       "strInstructions": "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.",
       "strMealThumb": "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
       "strTags": "Tart,Baking,Alcoholic",
       "strYoutube": "https://www.youtube.com/watch?v=1ahpSTf_Pvk",
       "strIngredient1": "plain flour",
       "strIngredient2": "chilled butter",
       "strIngredient3": "cold water",
       "strIngredient4": "raspberry jam",
       "strIngredient5": "butter",
       "strIngredient6": "caster sugar",
       "strIngredient7": "ground almonds",
       "strIngredient8": "free-range egg, beaten",
       "strIngredient9": "almond extract",
       "strIngredient10": "flaked almonds",
       "strIngredient11": "",
       "strIngredient12": "",
       "strIngredient13": "",
       "strIngredient14": "",
       "strIngredient15": "",
       "strIngredient16": null,
       "strIngredient17": null,
       "strIngredient18": null,
       "strIngredient19": null,
       "strIngredient20": null,
       "strMeasure1": "175g/6oz",
       "strMeasure2": "75g/2½oz",
       "strMeasure3": "2-3 tbsp",
       "strMeasure4": "1 tbsp",
       "strMeasure5": "125g/4½oz",
       "strMeasure6": "125g/4½oz",
       "strMeasure7": "125g/4½oz",
       "strMeasure8": "1",
       "strMeasure9": "½ tsp",
       "strMeasure10": "50g/1¾oz",
       "strMeasure11": "",
       "strMeasure12": "",
       "strMeasure13": "",
       "strMeasure14": "",
       "strMeasure15": "",
       "strMeasure16": null,
       "strMeasure17": null,
       "strMeasure18": null,
       "strMeasure19": null,
       "strMeasure20": null,
       "strSource": null,
       "strImageSource": null,
       "strCreativeCommonsConfirmed": null,
       "dateModified": null
     }
   ]
 }
 */

struct MealLookup: Decodable {
    let meals: [MealInstructions]
}

struct MealInstructions: Decodable, Identifiable {
    let id: String
    let name: String
    let drinkAlternate: String?
    let category: String
    let area: String
    let instructions: String
    let thumbnail: String
    let tags: String?
    let youtubeLink: String
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measure16: String?
    let measure17: String?
    let measure18: String?
    let measure19: String?
    let measure20: String?
    
    let source: String?
    let imageSource: String?
    let creativeCommons: String?
    let dateModified: Date?
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case tags = "strTags"
        case youtubeLink = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
        
        case source = "strSource"
        case imageSource = "strImageSource"
        case creativeCommons = "strCreativeCommonsConfirmed"
        case dateModified
    }
}

struct MealInstructionIngredientPrinter {
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
            .filter({$0.0 != nil && !$0.0!.isEmpty && $0.1 != nil && !$0.1!.isEmpty})
            .map({" \($0.0 ?? "") \($0.1 ?? "")"})
    }
}

struct MealInstructionPrinter {
    let instructions: MealInstructions
    
    func instructionList() -> [String] {
        let list = instructions.instructions.split(whereSeparator: { $0 == "\r\n"}).map({String($0)}).compactMap({$0})
        return list.enumerated().map({"     \($0+1). \($1)"})
    }
}
