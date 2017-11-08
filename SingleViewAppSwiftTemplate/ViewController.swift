//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//
/*
 ================
 Grading Requirements
 ================
(X) The core objects such as Entrants and Passes are defined using object oriented approach (class/struct/protocol/inheritance/composition)
(X) Enums are used for the definition of Entrant types and sub-types (e.g. employee types), Errors types, Guest types
    (X) Associated values are utilized when Enums are used to define some of the objects
(X) Initializer methods for the classes/structs are created
(X) Errors are implemented for various possible scenarios (such as missing birthday, missing first/last name)
(X) Errors provide descriptive information, such as the name of the object that caused the error, and the details of the error
(X) One or more swipe methods are implemented
    (X) Polymorphic methods are being implemented for swipe or related processing, such that the method is able to handle (or to be applied to) multiple entrant or pass types
    (X) Entrants are correctly alerted on their birthdays
    (X) Entrants are prevented from swiping twice within 5 seconds at the same checkpoint
 (X) When access is denied an alert message is given
 (X) Created (and commented out) test cases for each entrant type and at least two of their associated possible actions, according to the business rules matrix
 (X) Created test cases to demonstrate errors
 */
import UIKit

class ViewController: UIViewController {
    
 /*
     ---------------------------
     Swipe too soon error
     ---------------------------
     Use the simulator to demonstrate the swipe too soon error. Each button represents a swipe for the pass described
     at the named location. If any button is clicked twice in a row, in less than 5 seconds, the console will show an error
     message. Any other clicks should show the appropriate swipe outcome.
 
 */
    
    @IBAction func classicMainGateSwipe(_ sender: Any) {
        print("---------")
        northGate.swipe(pass: classicGuestBasicPass)
        print("---------")
        print("")
    }
    @IBAction func classicRollercoasterSwipe(_ sender: Any) {
        print("---------")
        rollerCoaster.swipe(pass: classicGuestBasicPass)
        print("---------")
        print("")
    }
    @IBAction func managerMainEntranceSwipe(_ sender: Any) {
        print("---------")
        northGate.swipe(pass: managerPass)
        print("---------")
        print("")
    }
    @IBAction func managerRollercoasterSwipe(_ sender: Any) {
        print("---------")
        rollerCoaster.swipe(pass: managerPass)
        print("---------")
        print("")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Error Free Swipes and Outcomes
         //Shows each pass (select which to view by going to EntrantDatabase.swift and then uncommenting desired sample pass(es)) and outcome at each tested location (select which to check by going to LocationsDatabase.swift and then uncommenting desired locations to perform swipe)
        for passToSwipe in errorFreeTestPasses {
            for exampleLocation  in locationsCollection {
                print("Swiping pass \(passToSwipe.hashID) of type \(passToSwipe.entrantType) at \(exampleLocation.name)")
                print("has the following results")
                exampleLocation.swipe(pass: passToSwipe)
                print()
                print("-------------")
                print()
 
            }
        }
        
        //Swipes and Outcomes with Errors
        //Shows each pass (select which to view by going to EntrantDatabase.swift and then uncommenting desired sample pass(es)) and outcome at each tested location (select which to check by going to LocationsDatabase.swift and then uncommenting desired locations to perform swipe)
        for passToSwipe in examplePassesWithErrors {
            for exampleLocation  in locationsCollection {
                print("Swiping pass \(passToSwipe.hashID) of type \(passToSwipe.entrantType) at \(exampleLocation.name)")
                print("has the following results")
                exampleLocation.swipe(pass: passToSwipe)
                print()
                print("-------------")
                print()
                
            }
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

