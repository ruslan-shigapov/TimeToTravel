//
//  DataManager.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 31.08.2023.
//

import Foundation

final class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoriteStatus(for flight: String, with status: Bool) {
        userDefaults.set(status, forKey: flight)
    }
    
    func getFavoriteStatus(for flight: String) -> Bool {
        userDefaults.bool(forKey: flight)
    }
}
