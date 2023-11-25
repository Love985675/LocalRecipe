//
//  Item.swift
//  LocalRecipeApp
//
//  Created by Lovekesh Singh on 25/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
