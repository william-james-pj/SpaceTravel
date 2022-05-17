//
//  ResultsViewModel.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 16/05/22.
//

import Foundation
import RxSwift
import RxRelay

class ResultsViewModel {
    var allFlightBehavior: BehaviorRelay<[TicketModel]> = BehaviorRelay(value: [])

    // MARK: - Lifecycle
    init() {
    }

    // MARK: - Methods
    func generateTicket(flight: FlightModel) {
        var aux: [TicketModel] = []
        let random = Int.random(in: 0..<3)
        for _ in 0...random {
            let today = Date()
            let day = Calendar.current.date(byAdding: .day, value: Int.random(in: 0..<60), to: today)!
            
            let months = calculeMonths(date: day, origin: flight.origin.distanceFromSun, destination: flight.destination.distanceFromSun, speed: flight.spacecraft.speed)
            let arrive = calculeArrive(date: day, origin: flight.origin.distanceFromSun, destination: flight.destination.distanceFromSun, speed: flight.spacecraft.speed)

            let newTicket = TicketModel(origin: flight.origin.name, destination: flight.destination.name, monthsTravel: months, dateArrive: getDateString(date: arrive), dateLeave: getDateString(date: day))
            aux.append(newTicket)
        }
        
        
        self.allFlightBehavior.accept(aux)
    }
    
    fileprivate func calculeMonths(date: Date, origin: Int, destination: Int, speed: Int) -> Int {
        let arrive = calculeArrive(date: date, origin: origin, destination: destination, speed: speed)
        
        let calendar = Calendar(identifier: .gregorian)
        return calendar.dateComponents([.month, .year], from: date, to: arrive).month ?? 0
    }
    
    fileprivate func calculeArrive(date: Date, origin: Int, destination: Int, speed: Int) -> Date {
        var distance = origin - destination
        if distance < 0 {
            distance *= -1
        }
        let hours = Float(distance) / Float(speed)
        let days = Int(hours / 24)

        return Calendar.current.date(byAdding: .day, value: days, to: date)!
    }
    
    fileprivate func getDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: date)
    }
}
