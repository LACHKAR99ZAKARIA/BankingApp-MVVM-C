//
//  Encodable+Extensions.swift
//  BankingUtilities
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


import Foundation

public extension Encodable {
    func dictionary() -> [String: String]? {
        guard let jsonData = try? JSONEncoder().encode(self),
              let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            return nil
        }
        return jsonObject.reduce(into: [String: String]()) { $0[$1.key] = "\($1.value)" }
    }
}
