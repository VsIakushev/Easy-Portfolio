//
//  ProfileViewModel.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import Foundation

// Put all logic here

final class ProfileViewModel: ObservableObject {
    var timeHorizonScore = 0
    var riskToleranceScore = 0
    var questionNumber = 0
    var progress: Float = 0.0
    
//    
//    @Published var timeHorizonQuestions: [Question] = [
//        Question(question: "I plan to begin withdrawing money from my investments in:",
//                 answers: ["Less than 3 years", "3–5 years", "6–10 years", "11 years or more"],
//                 scores: [1, 3, 7, 10]),
//        Question(question: "Once I begin withdrawing funds from my investments, I plan to spend all of the funds in:",
//                 answers: ["Less than 2 years", "2–5 years", "6–10 years", "11 years or more"],
//                 scores: [0, 1, 4, 8])
//    ]
//    
//    @Published var riskToleranceQuestions: [Question] = [
//        Question(question: "I would describe my knowledge of investments as:",
//                 answers: ["None", "Limited", "Good", "Extensive"],
//                 scores: [1, 3, 7, 10]),
//        Question(question: "What amount of financial risk are you willing to take when you invest?",
//                 answers: ["Take lower than average risks expecting to earn lower than average returns",
//                           "Take average risks expecting to earn average returns",
//                           "Take above average risks expecting to earn above average returns"
//                          ],
//                 scores: [0, 4, 8]),
//        Question(question: "Select the investments you currently own or have owned:",
//                 answers: ["Bonds and/or bond funds", "Stocks and/or stock funds", "International securities and/or international funds"],
//                 scores: [3, 6, 8]),
//        Question(question: "Imagine that in the past three months, the overall stock market lost 25% of its value. An individual stock investment you own also lost 25% of its value. What would you do?",
//                 answers: ["Sell all of my shares", "Sell some of my shares", "Do nothing", "Buy more shares"],
//                 scores: [0, 2, 5, 8]),
//        Question(question: "We’ve outlined the most likely best-case and worst-case annual returns of five hypothetical investment plans. Which range of possible outcomes is most acceptable to you? The figures are hypothetical and do not represent the performance of any particular investment.",
//                 answers: ["Average annual return: 2.6%, Best-case: 10.8%, Worst-case: -5.1%",
//                           "Average annual return: 4.1%, Best-case: 19.2%, Worst-case: -10.6%",
//                           "Average annual return: 5.1%, Best-case: 27.6%, Worst-case: -16.4%",
//                           "Average annual return: 6.1%, Best-case: 36.0%, Worst-case: -21.7%",
//                           "Average annual return: 7.2%, Best-case: 42.5%, Worst-case: -25.8%"
//                          ],
//                 scores: [0, 3, 6, 8, 10])
//    ]
//    
}
