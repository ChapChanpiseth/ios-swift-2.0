//
//  ResultViewController.swift
//  Roshabo
//
//  Created by Lion on 8/11/15.
//  Copyright (c) 2015 edu.self. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController{

    
    @IBOutlet weak var matchImage: UIImageView!
    @IBOutlet weak var labelMessage: UILabel!
    
    var rpsMatch: RPSMatch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        displayResult()
    }
    
    
    func getImageByName(winner: RPS) -> String {
        
        switch winner {
        case .Rock:
            return "RockCrushesScissors"
        case .Paper:
            return "PaperCoversRock"
        case .Scissors:
            return "ScissorsCutPaper"
//        default:
//            return "itsATie"
        }
    }
    
    func getMessage(winner: RPS) -> String {
        
        switch winner {
        case .Rock:
            return "Crushes"
        case .Paper:
            return "Covers"
        case .Scissors:
            return "Cuts"
//        default:
//            return "Nothing"
        }
    }
    
    func displayResult(){
        
        if ( rpsMatch.p1 == rpsMatch.p2) {
            
            labelMessage.text = "It is a tie !"
            matchImage.image = UIImage(named:"itsATie")
        } else if ( rpsMatch.winner == rpsMatch.p1) {
            
            labelMessage.text = "You win ! " + rpsMatch.p1.description + " " + getMessage(rpsMatch.p1) + " " + rpsMatch.p2.description
            matchImage.image = UIImage(named: "\(getImageByName(rpsMatch.p1))")
        } else {
            
            labelMessage.text = "You loss ! " + rpsMatch.p2.description + " " + getMessage(rpsMatch.p2) + " " + rpsMatch.p1.description
            matchImage.image = UIImage(named: "\(getImageByName(rpsMatch.p2))")
        }
    }
    
    @IBAction func playAgainButtonPressed(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}