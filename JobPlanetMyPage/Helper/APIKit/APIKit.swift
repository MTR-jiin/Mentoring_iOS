//
//  APIKit.swift
//  SCON_iOS
//
//  Created by moon.kwon on 2022/04/09.
//

import Foundation

protocol APIKitProtocol {
    func request(url: String, params: [String: Any]?) -> Result<Data, Error>
    func request<T: Decodable>(url: String, params: [String: Any]?, type: T.Type) -> Result<T, Error>
}

enum APIError: Error {
    case notFound
}

class APIKit: APIKitProtocol {
    
    static let shared: APIKit = .init()
    
    private init() { }
    
    func request(url: String, params: [String: Any]? = nil) -> Result<Data, Error> {
        // 필터링을 한번 걸어봅시다.
        var url = url
        if let params = params {
            url.append(":")
            let keys = params.keys.sorted()
            keys.forEach {
                guard let value = params[$0] else { return }
                url.append("\($0)=\(value),")
            }
            url.removeLast()
        }
        
        guard let path = Bundle.main.url(forResource: url, withExtension: "json") else {
            return .failure(APIError.notFound)
        }
        
        do {
            let data = try Data(contentsOf: path)
            return .success(data)
        } catch let error {
            return .failure(error)
        }
    }
    
    func request<T: Decodable>(url: String, params: [String: Any]? = nil, type: T.Type) -> Result<T, Error> {
        let result = request(url: url, params: params)
        switch result {
        case .success(let data):
            do {
                let t = try JSONDecoder().decode(type, from: data)
                return .success(t)
            } catch let error {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
