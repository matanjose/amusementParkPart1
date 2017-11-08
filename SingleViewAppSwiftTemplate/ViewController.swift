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
    (•) Associated values are utilized when Enums are used to define some of the objects
(X) Initializer methods for the classes/structs are created
(X) Errors are implemented for various possible scenarios (such as missing birthday, missing first/last name)
(•) Errors provide descriptive information, such as the name of the object that caused the error, and the details of the error
(X) One or more swipe methods are implemented
    (X) Polymorphic methods are being implemented for swipe or related processing, such that the method is able to handle (or to be applied to) multiple entrant or pass types
    (X) Entrants are correctly alerted on their birthdays
    (•) Entrants are prevented from swiping twice within 5 seconds at the same checkpoint
 (•) When access is denied an alert message is given
 (•) Created (and commented out) test cases for each entrant type and at least two of their associated possible actions, according to the business rules matrix
 (•) Created test cases to demonstrate errors
 */
import UIKit

class ViewController: UIViewController {
    

    @IBAction func SWIPENEWLOC(_ sender: Any) {
        rollerCoaster.swipe(pass: classicGuestWBirthdatePass)
    }
    
    @IBAction func SWIPE(_ sender: Any) {
        northGate.swipe(pass: classicGuestWBirthdatePass)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        for exampleLocation in locationsCollection {
            for passToSwipe in testPasses {
                print(passToSwipe.entrantType)
                print(exampleLocation.name)
                exampleLocation.swipe(pass: passToSwipe)
                print()
                print("-------------")
                print()
 
            }
        } */
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

