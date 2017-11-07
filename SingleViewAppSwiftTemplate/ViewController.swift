//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//
/* still need to fix:
 if a pass creates an error, should default to denying access to employee only areas.
 if a pass is not an employee pass, it should just automatically go to "deny entry"
 
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for exampleLocation in locationsCollection {
            for passToSwipe in testPasses {
                print(passToSwipe.entrantType)
                print(exampleLocation.name)
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

