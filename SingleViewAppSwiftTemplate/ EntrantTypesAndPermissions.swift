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


