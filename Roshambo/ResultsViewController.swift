//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Franziska Kammerl on 3/11/18.
//  Copyright © 2018 Franziska Kammerl. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var showResultsLabel: UILabel!
    @IBOutlet weak var showResultsImage: UIImageView!
    
    var play: Play!
    // Randomly Generate an opponent's play - rock, scissors or paper
    private let opponentPlay = Play.generatePlay()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compareResults()
    }
    
    private func compareResults() {
        let result = play.doesWin(against: opponentPlay)
        showResultsLabel.text = result.message
        showResultsImage.image = result.image
    }

    @IBAction func PlayAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

