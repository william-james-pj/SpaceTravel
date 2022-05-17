//
//  FlightModel.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 16/05/22.
//

import Foundation

class FlightModel {
    var origin: Planet
    var destination: Planet
    var spacecraft: SpacecraftModel
    
    init() {
        self.origin = Planet()
        self.destination = Planet()
        self.spacecraft = SpacecraftModel()
    }
    
    init(origin: Planet, destination: Planet, spacecraft: SpacecraftModel) {
        self.origin = origin
        self.destination = destination
        self.spacecraft = spacecraft
    }
}
