//
//  TestViewModel.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import Foundation

final class TestViewModel: ObservableObject {
    var timeHorizonScore = 0
    var riskToleranceScore = 0
    var questionNumber = 0
    var progress: Float = 0.0
    
    @Published var timeHorizonQuestions: [Question] = [
        Question(text: "I plan to begin withdrawing money from my investments in:", answers: [
        Answer(text: "Less than 3 years", score: 1),
        Answer(text: "3–5 years", score: 3),
        Answer(text: "6–10 years", score: 7),
        Answer(text: "11 years or more", score: 10),
        ]),
        Question(text: "Once I begin withdrawing funds from my investments, I plan to spend all of the funds in:", answers: [
            Answer(text: "Less than 2 years", score: 0),
            Answer(text: "2–5 years", score: 1),
            Answer(text: "6–10 years", score: 4),
            Answer(text: "11 years or more", score: 8),
        ])
    ]
    
    @Published var riskToleranceQuestions: [Question] = [
    Question(text: "I would describe my knowledge of investments as:", answers: [
        Answer(text: "None", score: 1),
        Answer(text: "Limited", score: 3),
        Answer(text: "Good", score: 7),
        Answer(text: "Extensive", score: 10),
    ]),
    
    Question(text: "What amount of financial risk are you willing to take when you invest?", answers: [
        Answer(text: "Take lower than average risks expecting to earn lower than average returns", score: 0),
        Answer(text: "Take average risks expecting to earn average returns", score: 4),
        Answer(text: "Take above average risks expecting to earn above average returns", score: 8),
    ]),
    
    Question(text: "Select the investments you currently own or have owned:", answers: [
        Answer(text: "Bonds and/or bond funds", score: 3),
        Answer(text: "Stocks and/or stock funds", score: 6),
        Answer(text: "International securities and/or international funds", score: 8),
    ]),
    
    Question(text: "Imagine that in the past three months, the overall stock market lost 25% of its value. An individual stock investment you own also lost 25% of its value. What would you do?", answers: [
        Answer(text: "Sell all of my shares", score: 0),
        Answer(text: "Sell some of my shares", score: 2),
        Answer(text: "Do nothing", score: 5),
        Answer(text: "Buy more shares", score: 8),
    ]),
    
    Question(text: "We’ve outlined the most likely best-case and worst-case annual returns of five hypothetical investment plans. Which range of possible outcomes is most acceptable to you? The figures are hypothetical and do not represent the performance of any particular investment.", answers: [
        Answer(text: "Average annual return: 2.6%, Best-case: 10.8%, Worst-case: -5.1%", score: 0),
        Answer(text: "Average annual return: 4.1%, Best-case: 19.2%, Worst-case: -10.6%", score: 3),
        Answer(text: "Average annual return: 5.1%, Best-case: 27.6%, Worst-case: -16.4%", score: 6),
        Answer(text: "Average annual return: 6.1%, Best-case: 36.0%, Worst-case: -21.7%", score: 8),
        Answer(text: "Average annual return: 7.2%, Best-case: 42.5%, Worst-case: -25.8%", score: 10),
    ]),
    ]
    
    @Published var alertRiskTestComplete = ["Test is Complete!", "Your Risk Score saved. Now You can create Goal and Portfolio"]
    
    @Published var alertGoalCreated = ["Your Goal & Portfolio successfuly created!", "Now You can see your Asset Allocaion in Portfolio bookmark"]
    
    @Published var alertFillAllTextFields = ["Empty fields left!", "Please fill in all fields: Goal's name, initial and final amounts"]
    
    @Published var alertWrongFormat = ["Wrong format!", "Amounts must be whole or fractional numbers"]
    
    
    var currentQuestionIndex = 0
    var totalRiskScore = 0
    
    func saveScore(currentQuestionIndex: Int, currentScore: Int) {
        if currentQuestionIndex > 2 {
            // save RiskToleranceScore
            UserDefaults.standard.set(currentScore, forKey: "userRiskToleranceScore")
            print("Saving Risk Tolerance Score")
        } else {
            // save TimeHorizonScore
            print("Saving Time Horizon Score")
        }
    }
    
    func saveUserRiskToleranceScore(currentScore: Int) {
        UserDefaults.standard.set(currentScore, forKey: "userRiskToleranceScore")
    }
    
    func loadUserRiskToleranceScore() {
        guard let score = UserDefaults.standard.integer(forKey: "userRiskToleranceScore") as? Int else { return }
        userRiskToleranceScore = score
    }
    
//    func saveNewGoal(currentQuestionIndex: Int, currentScore: Int, goalName: String, initialAmount: String, goalAmount: String) {
//        if currentQuestionIndex > 2 {
//            return
//        } else {
//            // save Goal Data
//            userGoals.append(Goal(name: goalName, timeHorizonScore: currentScore, currentAmount: Double(initialAmount) ?? 0, goalAmount: Double(goalAmount) ?? 0))
//        }
//    }
//    
//    func saveGoals(currentQuestionIndex: Int, goals: [Goal]) {
//        if currentQuestionIndex > 2 {
//            return
//        } else {
//            // save Goal Data
//            if let encoded = try? JSONEncoder().encode(goals) {
//                        UserDefaults.standard.set(encoded, forKey: "userGoals")
//                    }
//        }
//    }
//    
//    func loadGoals() -> [Goal] {
//        if let data = UserDefaults.standard.object(forKey: "userGoals") as? Data,
//                  let array = try? JSONDecoder().decode([Goal].self, from: data) {
//                   return array
//               }
//               print("There is no saved Goals")
//               return []
//    }
//    
//    func deleteGoal(index: Int ) {
//        
//    }
    
    
    
}

