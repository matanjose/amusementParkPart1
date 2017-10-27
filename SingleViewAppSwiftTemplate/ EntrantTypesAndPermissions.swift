//
//  People.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/24/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

enum PersonOfType {
    case classicGuest
    case vipGuest
    case freeChildGuest
}

extension PersonOfType {
    
    var canAccess: [ Area ] {
        switch self {
        case .classicGuest, .freeChildGuest, .vipGuest:
            return [ .amusement ]
        }
    }
    
    var receivesDiscountOn: [ Discount ] {
        switch self {
        case .classicGuest, .freeChildGuest:
            return []
        case .vipGuest:
            return [ .food10, .merchandise20 ]
        }
    }
    
    var hasRidePrivilegesTo: [ RidePrivilege ] {
        switch self {
        case .classicGuest, .freeChildGuest:
            return [ .accessAllRides ]
        case .vipGuest:
            return [ .accessAllRides, .skipLines]

        }
    }
}

enum Area {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum Discount {
    case food10
    case food15
    case merchandise20
    case merchandise25
    
}

enum RidePrivilege {
    case accessAllRides
    case skipLines
}


/*
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

extension entrant {
    func checkAreaAccess(to: Areas) /*throws*/ -> Bool {
        var isAccessible = false
        for (location, permission) in canAccess {
            if location != to {
                continue
            }
            if location == to && permission == true {
                isAccessible = true
            } else if
                location == to && permission == false {
                isAccessible = false
            } else if
                location != to {
                continue
            }
            //insert error here after reviewing errors
        }
        return isAccessible
    }

}





let accessDict = vipGuest.canAccess
let kitchenAccess = accessDict[.kitchen]

func printKitchenAccess() {
    let finalKitchenAccess = kitchenAccess!
    print(finalKitchenAccess)
}

*/
