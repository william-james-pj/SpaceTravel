//
//  SearchFlightsViewModel.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 16/05/22.
//

import Foundation
import RxSwift
import RxRelay

class SearchFlightsViewModel {
    var flightBehavior: BehaviorRelay<FlightModel> = BehaviorRelay(value: FlightModel())
    var planets: [Planet] = []
    
    // MARK: - Lifecycle
    init() {
        setPlanet()
    }

    // MARK: - Methods
    func getPlanetName() -> [String] {
        return planets.map { $0.name }
    }
    
    func setOrigin(to planetIndex: Int) {
        let flightAux = self.flightBehavior.value
        flightAux.origin = self.planets[planetIndex]
        self.flightBehavior.accept(flightAux)
    }
    
    func setDestination(to planetIndex: Int) {
        let flightAux = self.flightBehavior.value
        flightAux.destination = self.planets[planetIndex]
        self.flightBehavior.accept(flightAux)
    }
    
    func setSpacecraft(to spacecraft: SpacecraftModel) {
        let flightAux = self.flightBehavior.value
        flightAux.spacecraft = spacecraft
        self.flightBehavior.accept(flightAux)
    }
    
    fileprivate func setPlanet() {
        let aux: [Planet] = [
            Planet(name: "Mercury", distamceFromSun: 57900000),
            Planet(name: "Venus", distamceFromSun: 108200000),
            Planet(name: "Earth", distamceFromSun: 149600000),
            Planet(name: "Mars", distamceFromSun: 227900000),
            Planet(name: "Jupiter", distamceFromSun: 778300000),
            Planet(name: "Saturn", distamceFromSun: 1427000000),
        ]
        planets = aux
    }
}
