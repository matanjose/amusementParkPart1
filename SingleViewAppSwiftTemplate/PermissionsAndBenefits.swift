//
//  PermissionsAndBenefits.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/28/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

//Area Permissions
let classicGuestAreas: [Areas : Bool] = [.amusement : true, .kitchen : false, .maintenance : false, .office : false, .rideControl : false]

let freeChildGuestAreas: [Areas : Bool] = [.amusement : false, .kitchen : false, .maintenance : false, .office : false, .rideControl : true]

let vipGuestAreas: [Areas : Bool] = [.amusement : true, .kitchen : true, .maintenance : true, .office : true, .rideControl : true]

//Discounts

let classicAndFreeChildGuestDiscounts: [Discounts : Bool] = [.food10 : true, .food15 : false, .merchandise20 : true, .merchandise25 : false]

let vipGuestDiscounts: [Discounts : Bool] = [.food10 : false, .food15 : false, .merchandise20 : false, .merchandise25 : false]

//Priority Ride Access



