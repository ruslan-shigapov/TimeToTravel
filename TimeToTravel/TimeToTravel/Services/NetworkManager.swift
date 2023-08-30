//
//  NetworkManager.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
            
    private let headers: HTTPHeaders = [
        "authority": "vmeste.wildberries.ru",
        "accept": "application/json, text/plain, */*",
        "cache-control": "no-cache",
        "content-type": "application/json",
        "origin": "https://vmeste.wildberries.ru",
        "pragma": "no-cache",
        "referer": "https://vmeste.wildberries.ru/avia",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin"
    ]
    
    private init() {}
    
    func sendRequest(completion: @escaping (Result<Response, AFError>) -> Void) {
        AF.request(
            "https://vmeste.wildberries.ru/stream/api/avia-service/v1/suggests/getCheap",
            method: .post,
            parameters: ["startLocationCode": "KZN"],
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
            .validate()
            .responseDecodable(of: Response.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
