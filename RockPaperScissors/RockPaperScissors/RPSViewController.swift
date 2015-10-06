//
//  ViewController.swift
//  Roshabo
//
//  Created by Lion on 8/11/15.
//  Copyright (c) 2015 edu.self. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {
    
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    var rpsMatch: RPSMatch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func MakeYourMove(sender: UIButton) {
        
        switch sender {
        case rockButton:
            throwDownHand(userGesture: RPS.Rock)
            
        case paperButton:
            throwDownHand(userGesture: RPS.Paper)
            
        case scissorsButton:
            throwDownHand(userGesture: RPS.Scissors)
            
        default:
            print("No action!")
        }
        
    }
    
    
    func throwDownHand(userGesture playerMove: RPS){
        
        let machineMove = RPS()
        rpsMatch = RPSMatch(p1: playerMove, p2: machineMove)
        
        if ( playerMove == RPS.Rock ) {
            
            let resultViewController: ResultViewController
            resultViewController = storyboard?.instantiateViewControllerWithIdentifier("ResultViewControllerID") as! ResultViewController
            
            resultViewController.rpsMatch = rpsMatch
            
            presentViewController(resultViewController, animated: true, completion: nil)
            
        } else {
            
            performSegueWithIdentifier("playRPS", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            let resultViewController = segue.destinationViewController as! ResultViewController
            resultViewController.rpsMatch = rpsMatch
    }
    
}
