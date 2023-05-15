//
//  GoalManager.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 13.05.2023.
//

import Foundation
//import Combine

class GoalManager: ObservableObject {
    static let shared = GoalManager()
    
    @Published var userGoals: [Goal] {
        didSet {
            saveGoals()
        }
    }
    
    private init() {
        // Loading goals from defaults
        if let data = UserDefaults.standard.object(forKey: "userGoals") as? Data,
           let array = try? JSONDecoder().decode([Goal].self, from: data) {
            userGoals = array
        } else {
            userGoals = []
        }
    }
    
    func addNewGoal(currentQuestionIndex: Int, currentScore: Int, goalName: String, initialAmount: String, goalAmount: String) {
        if currentQuestionIndex > 2 {
            return
        } else {
            // save Goal Data
            print(userGoals.count)
            userGoals.append(Goal(name: goalName, timeHorizonScore: currentScore, currentAmount: Double(initialAmount) ?? 0, goalAmount: Double(goalAmount) ?? 0))
            print(userGoals.count)
        }
    }
    
    func saveGoals() {
//        if currentQuestionIndex ?? 0 > 2 {
//            return
//        } else {
            // save Goal Data
        print(userGoals.count)
            if let encoded = try? JSONEncoder().encode(userGoals) {
                        UserDefaults.standard.set(encoded, forKey: "userGoals")
                print(userGoals.count)
                    }
//        }
    }
    
    func removeGoal(goal: Goal) {
        if let index = userGoals.firstIndex(of: goal) {
            userGoals.remove(at: index)
            saveGoals()
        }
    }
    
}
