//
//  SelectionViewController.swift
//  Roshambo
//
//  Created by Franziska Kammerl on 3/11/18.
//  Copyright © 2018 Franziska Kammerl. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    private var play: Play? {
        didSet {
            showResult()
        }
    }
    
    @IBAction func rockTapped(_ sender: Any) {
        play = .rock
    }
    @IBAction func paperTapped(_ sender: Any) {
        play = .paper
    }
    @IBAction func scissorsTapped(_ sender: Any) {
        play = .scissors
    }
    
    private func showResult() {
        performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let nextViewController = segue.destination as? ResultsViewController {
                nextViewController.play = play
            }
        }
    }
}
