//
//  Preferences.swift
//  Yelp
//
//  Created by Andrew Wilkes on 9/7/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation

struct Preferences {
    var sort: YelpSortMode?
    var categories: [String]?
    var radius: Int?
    var deals: Bool?
}