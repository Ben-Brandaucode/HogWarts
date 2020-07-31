//
//  MainTableViewController.swift
//  HogWartsHousesAustin
//
//  Created by Ben Brandau Brandau on 7/30/20.
//  Copyright © 2020 Ben Brandau. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return houseGuessController.shared.fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return houseGuessController.shared.fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GuessCell", for: indexPath) as? HouseGuessTableViewCell else {return UITableViewCell()}
        let guessToDisplay =  houseGuessController.shared.fetchedResultsController.object(at: indexPath)
        cell.guess = guessToDisplay

        return cell
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let guessToDelete = houseGuessController.shared.fetchedResultsController.object(at: indexPath)
            houseGuessController.shared.remove(houseGuess: guessToDelete)
        }
    }
  

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 7
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return houseGuessController.shared.fetchedResultsController.sectionIndexTitles[section] == "0" ? "Invisibility Cloak" : "Invisible"
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }
    
    //HELPers
    func presentertController(){
        
        let alertController   = UIAlertController(title: "Add house Guess", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "person's name...:"
        }
        alertController.addTextField { (textfield) in
            textfield.placeholder  = "PERSON IN Hogwarts House..."
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel,handler: nil)
        let addguessAction = UIAlertAction(title: "add", style: .default) { (_) in
            guard let guessName = alertController.textFields![0].text, !guessName.isEmpty, let house = alertController.textFields?[1].text, !house.isEmpty else {return}
            }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addguessAction)
        
        present( alertController, animated: true)
        
            
        }
    }

