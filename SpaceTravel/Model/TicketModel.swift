//
//  TicketModel.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 16/05/22.
//

import Foundation

class TicketModel {
    var origin: String
    var destination: String
    var monthsTravel: Int
    var dateArrive: String
    var dateLeave: String
    
    init() {
        self.origin = ""
        self.destination = ""
        self.monthsTravel = 0
        self.dateArrive = ""
        self.dateLeave = ""
    }
    
    init(origin: String, destination: String, monthsTravel: Int, dateArrive: String, dateLeave: String) {
        self.origin = origin
        self.destination = destination
        self.monthsTravel = monthsTravel
        self.dateArrive = dateArrive
        self.dateLeave = dateLeave
    }
}
