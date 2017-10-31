//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 9/11/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Entrant {
    var entrantType: PersonOfType { get {
        return .classicGuest
        }
        set {}
    }
}

class VIPGuest: Entrant {
    override var entrantType: PersonOfType { get {
        return .vipGuest
        }
        set {}
    }
}

class FreeChildGuest: Entrant {
    var age: Int
    init(age: Int) {
        self.age = age
        super.init()
    }
    override var entrantType: PersonOfType { get {
        return .freeChildGuest
        }
        set {}
    }

    
    
   
    
    
}

