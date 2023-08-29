//
//  DetailsViewModel.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

protocol DetailsViewModelProtocol {
    init(flight: Flight)
}

final class DetailsViewModel: DetailsViewModelProtocol {
    
    private let flight: Flight
    
    required init(flight: Flight) {
        self.flight = flight
    }
}
