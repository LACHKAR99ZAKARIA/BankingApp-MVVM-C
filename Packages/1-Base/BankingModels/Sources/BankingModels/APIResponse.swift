//
//  APIResponse.swift
//  BankingModels
//
//  Created by Zakaria Lachkar on 28/8/2026.
//


public struct APIResponse<T: Decodable>: Decodable {
    public let data: T
}
