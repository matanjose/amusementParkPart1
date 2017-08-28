//
//  People.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/24/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

enum PersonType {
    case classicGuest
    case vipGuest
    case freeChildGuest
}

enum Areas {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum Discounts {
    case food10
    case food15
    case merchandise20
    case merchandise25
    
}

struct entrant {
    let entrantType: PersonType
    var canAccess: [Areas : Bool] {
        switch self.entrantType {
        case .classicGuest :
            return classicGuestAreas
        case .freeChildGuest :
            return freeChildGuestAreas
        case .vipGuest :
            return vipGuestAreas
        }
    }
    
    var receivesDiscountFor: [Discounts : Bool] {
        switch self.entrantType {
        case .classicGuest, .freeChildGuest :
            return classicAndFreeChildGuestDiscounts
        case .vipGuest :
            return vipGuestDiscounts
        }
    }

}





let accessDict = vipGuest.canAccess
let kitchenAccess = accessDict[.kitchen]

func printKitchenAccess() {
    let finalKitchenAccess = kitchenAccess!
    print(finalKitchenAccess)
}


