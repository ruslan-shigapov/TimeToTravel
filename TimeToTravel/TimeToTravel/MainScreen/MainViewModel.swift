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
    func getDetailsViewModel(at indexPath: IndexPath) -> DetailsViewModelProtocol
}

final class MainViewModel: MainViewModelProtocol {
    
    private var flights: [Flight] = []
    
    func fetchFlights(completion: @escaping () -> Void) {
        NetworkManager.shared.sendRequest { [weak self] result in
            switch result {
            case .success(let response):
                self?.flights = response.flights
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        flights.count
    }
    
    func getDetailsViewModel(at indexPath: IndexPath) -> DetailsViewModelProtocol {
        DetailsViewModel(flight: flights[indexPath.row])
    }
}
