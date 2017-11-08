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
    case foodServices
    case rideServices
    case maintenanceWorker
    case manager
    
    
}

extension PersonOfType {
    var passType: String {
        switch self {
        case .classicGuest:  return   "Classic Guest Pass"
        case .vipGuest: return "VIP Guest Pass"
        case .freeChildGuest: return "Free Child Guest Pass"
        case .foodServices: return "Food Services Employee Pass"
        case .rideServices: return "Ride Services Employee Pass"
        case .maintenanceWorker: return "Maintenance Employee Pass"
        case .manager: return "Manager Employee Pass"
        }
    }
    var canAccess: [ Area ] {
        switch self {
        case .classicGuest, .freeChildGuest, .vipGuest:
            return [ .amusement ]
        case .foodServices : return [ .amusement, .kitchen]
        case .rideServices : return [ .amusement, .rideControl]
        case .maintenanceWorker : return [ .amusement, .kitchen, .rideControl, .maintenance]
        case .manager : return [.amusement, .kitchen, .rideControl, .maintenance, .office]
        }
    }
    
    var receivesDiscountOn: [ Discount ] {
        switch self {
        case .classicGuest, .freeChildGuest:
            return []
        case .vipGuest:
            return [ .food10, .merchandise20 ]
        case .foodServices, .rideServices, .maintenanceWorker:
            return [.food15, .merchandise25]
        case .manager :
            return [.food25, .merchandise25]
        }
    }
    
    var hasRidePrivilegesTo: [ RidePrivilege ] {
        switch self {
        case .classicGuest, .freeChildGuest, .maintenanceWorker, .foodServices, .rideServices, .manager:
            return [ .accessAllRides ]
        case .vipGuest:
            return [ .accessAllRides, .skipLines]

        }
    }
    
    var dataRequiredForProfile: [ RequiredData ] {
        switch self {
        case .classicGuest, .vipGuest:
            return [ .none ]
        case .freeChildGuest:
            return [ .birthdate ]
        case .foodServices, .maintenanceWorker, .manager, .rideServices:
            return [ .firstName, .lastName, .streetAddress, .city, .state, .zipCode ]
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
    case food25
    case merchandise20
    case merchandise25
    
}

enum RidePrivilege {
    case accessAllRides
    case skipLines
}

enum SwipeType {
    case rides
    case access
    case discounts
}

enum RequiredData: String {
    case none = "None"
    case birthdate = "Birthdate"
    case firstName = "First Name"
    case lastName = "Last Name"
    case streetAddress = "Street Address"
    case city = "City"
    case state = "State"
    case zipCode = "Zip Code"
}
