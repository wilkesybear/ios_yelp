//
//  Preferences.swift
//  Yelp
//
//  Created by Andrew Wilkes on 9/7/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation

struct Preferences {
    var sortName: String?
    var categories: [String]?
    var radius: String?
    var deals: Bool?
    
    let stringToRadiusMap = [
        "2 blocks": 100,
        "6 blocks": 800,
        "1 mile": 1600,
        "5 miles": 8000
    ]
    
    let radiusValues = [
        "Best Match",
        "2 blocks",
        "6 blocks",
        "1 mile",
        "5 miles"
    ]
    
    let stringToSortByMap = [
        "Best Match" : YelpSortMode.BestMatched,
        "Shortest Distance" : YelpSortMode.Distance,
        "Highest Rating" : YelpSortMode.HighestRated,
    ]
    
    let sortByValues = [
        "Best Match",
        "Shortest Distance",
        "Highest Rating"
    ]
    
    func stringToRadius() -> Int? {
        if let val = radius {
            return stringToRadiusMap[val] ?? nil
        } else {
            return nil
        }
    }
    
    func stringToSortByValue() -> YelpSortMode? {
        if let name = sortName {
            return stringToSortByMap[name] ?? nil
        } else {
            return nil
        }
    }
}