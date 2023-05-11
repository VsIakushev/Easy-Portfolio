//
//  Goal.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 10.05.2023.
//

import Foundation

struct Goal: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    var name: String
    var timeHorizonScore: Int
    var currentAmount: Double
    var goalAmount: Double
}
