//
//  SpacecraftModel.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 16/05/22.
//

import Foundation

class SpacecraftModel {
    let name: String
    let speed: Int
    
    init() {
        self.name = ""
        self.speed = 0
    }
    
    init(name: String, speed: Int) {
        self.name = name
        self.speed = speed
    }
}
