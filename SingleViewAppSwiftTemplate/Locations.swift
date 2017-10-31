//
//  Locations.swift
//  SingleViewAppSwiftTemplate
//
//  Created by José Francisco Portuondo-Dember on 10/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
class Location {
    let name: String
    var locationType: Area?
    
    init(name: String) {
        self.name = name
    }
    func swipe(name: Entrant) {
       let permission = name.entrantType.canAccess
        guard let accessType = self.locationType, accessType != nil else {
            print("LocationType Not Specified")
            return
        }
        
        if permission.contains(accessType) {
            print("Access to \(self.name) granted")
        } else {
            print("Access to \(self.name) denied")
        }
    }
}

class Ride: Location {
    override var locationType: Area? { get {
        return .amusement
        }
        set {}
    }
}

