//
//  GoalManager.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 13.05.2023.
//

import Foundation

class GoalManager {
    static let shared = GoalManager()
    
    var userGoals: [Goal] = []
    
    private init() {
        // Loading goals from defaults
        if let data = UserDefaults.standard.object(forKey: "userGoals") as? Data,
           let array = try? JSONDecoder().decode([Goal].self, from: data) {
            userGoals = array
        } else {
            userGoals = []
        }
    }
    
    
    
}
