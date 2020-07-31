//
//  houseGuessControler.swift
//  HogWartsHousesAustin
//
//  Created by Ben Brandau Brandau on 7/30/20.
//  Copyright © 2020 Ben Brandau. All rights reserved.
//

import Foundation
import CoreData

class houseGuessController{
    
    // Mark Singleton
    static let shared = houseGuessController()
    
    //class properties
    let fetchedResultsController: NSFetchedResultsController<HouseGuess> = {
        let fetchRequest : NSFetchRequest<HouseGuess> = HouseGuess.fetchRequest()
        let veildSort = NSSortDescriptor(key: "isVisible", ascending: false)
        fetchRequest.sortDescriptors = [veildSort]
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isVisible", cacheName: nil)
        
    }()
    init(){
        do{
            try fetchedResultsController.performFetch()
        }catch{
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    
    // CRUD
    func createGuess(guessName: String, house: String){
        _ = HouseGuess(guessName:guessName, house:house)
        saveToPersistentStore()
    }
    
    func updateVisablity(houseGuess: HouseGuess){
        houseGuess.isVisible = !houseGuess.isVisible
        saveToPersistentStore()
    }
    
    func remove(houseGuess: HouseGuess){
        let moc = CoreDataStack.context
        moc.delete(houseGuess)
        saveToPersistentStore()
        //save
    }
    
    // Mark; - Persistence
    func saveToPersistentStore(){
        do{
            try CoreDataStack.context.save()
        }catch{
             print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    
}
