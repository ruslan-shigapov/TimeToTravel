//
//  Flight.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

struct Response: Decodable {
    let flights: [Flight]
}

struct Flight: Decodable {
    let startDate: String
    let endDate: String
    let startLocationCode: String
    let endLocationCode: String
    let startCity: String
    let endCity: String
    let price: Int
}
