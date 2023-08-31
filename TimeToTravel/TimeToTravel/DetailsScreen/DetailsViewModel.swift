//
//  DetailsViewModel.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 31.08.2023.
//

import Foundation

protocol DetailsViewModelProtocol {
    var price: String { get }
    var direction: String { get }
    var startDate: String { get }
    var endDate: String { get }
    var startLocation: String { get }
    var startLocationCode: String { get }
    var endLocation: String { get }
    var endLocationCode: String { get }
    var startCity: String { get }
    var endCity: String { get }
    var isFavorite: Bool { get }
    var viewModelDidChange: ((DetailsViewModelProtocol) -> Void)? { get set }
    init(flight: Flight)
    func toggleFavorite()
}

final class DetailsViewModel: DetailsViewModelProtocol {

    var price: String {
        "\(flight.price) \u{20BD}"
    }
    
    var direction: String {
        flight.startCity + " - " + flight.endCity
    }
    
    var startDate: String {
        getFormattedDate(from: flight.startDate)
    }
    
    var endDate: String {
        flight.endDate.first == "0"
        ? getFormattedDate(from: flight.startDate)
        : getFormattedDate(from: flight.endDate)
    }
    
    var startLocation: String {
        flight.startCity + ", " + flight.startLocationCode
    }
    
    var startLocationCode: String {
        flight.startLocationCode
    }
    
    var endLocation: String {
        flight.endCity + ", " + flight.endLocationCode
    }
    
    var endLocationCode: String {
        flight.endLocationCode
    }

    var startCity: String {
        flight.startCity
    }
    
    var endCity: String {
        flight.endCity
    }
    
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(for: flight.searchToken)
        } set {
            DataManager.shared.setFavoriteStatus(
                for: flight.searchToken,
                with: newValue
            )
            viewModelDidChange?(self)
        }
    }
    
    var viewModelDidChange: ((DetailsViewModelProtocol) -> Void)?
    
    private let flight: Flight
    
    required init(flight: Flight) {
        self.flight = flight
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
    }
    
    private func getFormattedDate(from date: String) -> String {
        let format = date.components(separatedBy: " ")
            .dropLast()
            .joined(separator: " ")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        guard let date = formatter.date(from: format) else { return "" }
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

