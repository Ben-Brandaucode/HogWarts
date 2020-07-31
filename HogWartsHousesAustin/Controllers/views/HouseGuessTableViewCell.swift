//
//  HouseGuessTableViewCell.swift
//  HogWartsHousesAustin
//
//  Created by Ben Brandau Brandau on 7/30/20.
//  Copyright © 2020 Ben Brandau. All rights reserved.
//

import UIKit

class HouseGuessTableViewCell: UITableViewCell {

    // OUTLETS
    
    @IBOutlet weak var personGuessLabel: UILabel!
    @IBOutlet weak var houseImageButton: UIButton!
    
//properties
    var guess: HouseGuess?{
        didSet{
            updateViews()
        }
    }
// Action
    
    @IBAction func HouseButtonTappoed(_ sender: Any) {
    }
// HELPERS
    
    func updateViews(){
        guard let guess = guess else {return}
        personGuessLabel.text = guess.guessName
        
        
    }
    

}
