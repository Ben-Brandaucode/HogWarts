//
//  CoreDataStack.swift
//  HogWartsHousesAustin
//
//  Created by Ben Brandau Brandau on 7/30/20.
//  Copyright © 2020 Ben Brandau. All rights reserved.
//

import Foundation

import CoreData

class  CoreDataStack{
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "hogWartshousesAustin")
        container.loadPersistentStores { (storedescription, error) in
            if let error = error{
                print(" Error im\(error.localizederror)")
                
            }
        }
    }return container
}()
static var context: NSManagedObjectContext{ return container.viewContext}

}
