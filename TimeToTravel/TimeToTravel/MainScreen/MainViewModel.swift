//
//  MainViewModel.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

import Foundation

protocol MainViewModelProtocol {
    func fetchFlights(completion: @escaping () -> Void)
    func numberOfRows() -> Int
    func getFlightCellViewModel(at indexPath: IndexPath) -> FlightCellViewModelProtocol
    func getDetailsViewModel(at indexPath: IndexPath) -> DetailsViewModelProtocol
}

final class MainViewModel: MainViewModelProtocol {
    
    private var flights: [Flight] = []
    
    func fetchFlights(completion: @escaping () -> Void) {
        <#code#>
    }
    
    func numberOfRows() -> Int {
        flights.count
    }
    
    func getFlightCellViewModel(at indexPath: IndexPath) -> FlightCellViewModelProtocol {
        FlightCellViewModel(flight: flights[indexPath.row])
    }
    
    func getDetailsViewModel(at indexPath: IndexPath) -> DetailsViewModelProtocol {
        DetailsViewModel(flight: flights[indexPath.row])
    }
}