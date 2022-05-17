//
//  HomeViewModel.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 16/05/22.
//

import Foundation

class HomeViewModel {
    var spacecraft: [SpacecraftModel] = []
    var spacecraftSelected: SpacecraftModel = SpacecraftModel()
    
    // MARK: - Lifecycle
    init() {
        setSpacecraft()
    }

    // MARK: - Methods
    func setSpacecraftSelected(selectIndex: Int) {
        self.spacecraftSelected = self.spacecraft[selectIndex]
    }
    
    fileprivate func setSpacecraft() {
        let aux: [SpacecraftModel] = [
            SpacecraftModel(name: "Millennium Falcon", speed: 1050),
            SpacecraftModel(name: "X-wing", speed: 1050),
            SpacecraftModel(name: "USS Enterprise", speed: 10000),
        ]
        self.spacecraft = aux
        self.spacecraftSelected = aux[1]
    }
}
