//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 9/11/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Entrant {
    //determines type of entrant, to establish restrictions and/or privileges
    var entrantType: PersonOfType { get {
        return .classicGuest
        }
        set {}
    }
    //Birthday Info, generally optional
    var birthdayString: String?
    init() {}
    init(birthday: String?) {
        self.birthdayString = birthday
    }
    var birthdate: Date? {
        dateFormatter.dateStyle = DateFormatter.Style.short
        switch birthdayString {
        case .none:
            return nil
        case .some:
            let date = dateFormatter.date(from: birthdayString!)
            return date
        }
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

    override var entrantType: PersonOfType { get {
        return .freeChildGuest
        }
        set {}
    }

    
    
   
    
    
}

