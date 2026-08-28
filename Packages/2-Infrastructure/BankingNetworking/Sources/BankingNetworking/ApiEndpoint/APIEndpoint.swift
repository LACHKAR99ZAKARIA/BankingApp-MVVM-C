//
//  APIEndpoint.swift
//  BankingNetworking
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var query: [String: Any]? { get }
}

extension APIEndpoint {
    var baseURL: URL {
        URL(string: "http://localhost:3000")!
    }
    
    var query: [String: Any]? {
        nil
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var parameters: [String : Any]? {
        nil
    }
}
