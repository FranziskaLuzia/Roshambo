//
//  Play.swift
//  Roshambo
//
//  Created by Franziska Kammerl on 3/11/18.
//  Copyright © 2018 Franziska Kammerl. All rights reserved.
//

import UIKit

enum Play: Int {
    case paper
    case scissors
    case rock
    
    var image: UIImage {
        switch self {
        case .paper: return #imageLiteral(resourceName: "paper")
        case .scissors: return #imageLiteral(resourceName: "scissors")
        case .rock: return #imageLiteral(resourceName: "rock")
        }
    }
    
    func doesWin(against play: Play) -> (message: String, image: UIImage) {
        guard self != play else {
            return (message: self.tieMessage, self.tieImage)
        }
        
        switch self {
        case .paper where play == .rock: return (message: self.successMessage, image: self.successImage)
        case .rock where play == .scissors: return (message: self.successMessage, image: self.successImage)
        case .scissors where play == .paper: return (message: self.successMessage, image: self.successImage)
        default: return (message: play.successMessage, image: play.successImage)
        }
    }
    
    var successMessage: String {
        switch self {
        case .paper:
            return "Paper beats rock"
        case .scissors:
            return "Scissors beat paper"
        case .rock:
            return "Rock beats scissors"
        }
    }
    
    var tieMessage: String {
        return "It's a tie"
    }
    
    var successImage: UIImage {
        switch self {
        case .paper:
            return #imageLiteral(resourceName: "PaperCoversRock")
        case .scissors:
            return #imageLiteral(resourceName: "ScissorsCutPaper")
        case .rock:
            return #imageLiteral(resourceName: "RockCrushesScissors")
        }
    }
    
    var tieImage: UIImage {
        return #imageLiteral(resourceName: "itsATie")
    }
    
    static func generatePlay() -> Play {
        let playIndex = Int(arc4random_uniform(3))
        let opponentPlay = Play(rawValue: playIndex)
        return opponentPlay!
    }
}



