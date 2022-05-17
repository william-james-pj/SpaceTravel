//
//  Planet.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 16/05/22.
//

import Foundation

class Planet {
    let name: String
    let distanceFromSun: Int
    
    init() {
        self.name = ""
        self.distanceFromSun = 0
    }
    
    init(name: String, distamceFromSun: Int) {
        self.name = name
        self.distanceFromSun = distamceFromSun
    }
}
