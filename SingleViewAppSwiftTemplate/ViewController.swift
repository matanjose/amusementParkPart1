//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Kid Joey is a \(kidJoey.entrantType)")
        northGate.swipe(name: kidJoey)
        rollercoaster.swipe(name: kidJoey)
        
        print("")
        
        print("Harry Potter is a \(harryPotter.entrantType)")
        northGate.swipe(name: harryPotter)
        rollercoaster.swipe(name: harryPotter)
        
        
        
       }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

