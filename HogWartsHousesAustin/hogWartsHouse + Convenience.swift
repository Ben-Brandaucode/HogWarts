//
//  hogWartsHouse + Convenience.swift
//  HogWartsHousesAustin
//
//  Created by Ben Brandau Brandau on 7/30/20.
//  Copyright © 2020 Ben Brandau. All rights reserved.
//

import Foundation
import CoreData

extension HouseGuess{
    
    convenience init (guessName: String, house: String, isVisible: Bool = false, context:NSManagedObject){
        self.init(context: context)
        self.guessname: guessName
        self.house = house
        self.isVisible = isVisible
    }
}
