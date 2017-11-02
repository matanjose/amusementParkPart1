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
        
       print("Andrew is a \(andrew.entrantType)")
        print("Andrew's Birthday is \(String(describing: andrew.birthdate))")
    
        print("1")
     
        print("Harry Potter is a \(harryPotter.entrantType)")
        print("Harry Potter's birthday is \(String(describing: harryPotter.birthdate))")
        northGate.swipe(name: harryPotter)
        rollerCoaster.swipe(name: harryPotter)
        mainStore.swipe(name: harryPotter)
        
        print("1")
        
        print("Matthew is a \(matthew.entrantType)")
        print("Matthew's birthday is \(String(describing: matthew.birthdate))")
        
        print("1")
        
        print("Baby Joey is a \(babyJoey.entrantType)")
        print("Baby Joey's birthday is \(String(describing: babyJoey.birthdate))")
        print("Baby Joey's pass is still valid: \(babyJoey.ageIsStillValid)")
      
        
        
       }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

