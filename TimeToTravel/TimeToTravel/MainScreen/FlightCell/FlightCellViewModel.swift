//
//  FlightCellViewModel.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

import Foundation

protocol FlightCellViewModelProtocol {
    var startDate: String { get }
    var startLocationCode: String { get }
    var endDate: String { get }
    var endLocationCode: String { get }
    var startCity: String { get }
    var endCity: String { get }
    var price: String { get }
    init(flight: Flight)
}

final class FlightCellViewModel: FlightCellViewModelProtocol {
    
    var startDate: String {
        getFormattedDate(from: flight.startDate)
    }
    
    var startLocationCode: String {
        flight.startLocationCode
    }
    
    var endDate: String {
        flight.endDate.first == "0"
        ? getFormattedDate(from: flight.startDate)
        : getFormattedDate(from: flight.endDate)
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
    
    var price: String {
        "\(flight.price) \u{20BD}"
    }
    
    private let flight: Flight
    
    required init(flight: Flight) {
        self.flight = flight
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
