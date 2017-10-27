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
        print("free child guest")
      freeChildGuest.checkAreaAccess()
        freeChildGuest.checkDiscountAccess()
        freeChildGuest.checkRidePrivileges()
        
        print("VIP Guest")
        vipGuest.checkAreaAccess()
        vipGuest.checkDiscountAccess()
        vipGuest.checkRidePrivileges()
        
        print("Regular Guest")
        classicGuest.checkAreaAccess()
        classicGuest.checkDiscountAccess()
        classicGuest.checkRidePrivileges()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

