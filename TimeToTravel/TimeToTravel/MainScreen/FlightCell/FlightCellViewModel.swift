//
//  FlightCellViewModel.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

protocol FlightCellViewModelProtocol {
    init(flight: Flight)
}

final class FlightCellViewModel: FlightCellViewModelProtocol {
    
    private let flight: Flight
    
    required init(flight: Flight) {
        self.flight = flight
    }
}
