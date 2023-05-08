//
//  Question.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let answers: [Answer]
}

//struct Question {
//    let question: String
//    let answers: [String]
//    let scores: [Int]
//}
