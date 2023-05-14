//
//  GoalDetailsView.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 13.05.2023.
//

import SwiftUI

struct GoalDetailsView: View {
    @State var goal: Goal
    var body: some View {
        Text("Goal's Details")
            .bold()
        Text("Goal's name: goal.name")
        Text("Initial amount: $\(String(format: "%.2f", goal.currentAmount))")
        Text("Amount for this Goal: $\(String(format: "%.2f",goal.goalAmount))")
    }
}

struct GoalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailsView(goal: Goal(name: "Goal", timeHorizonScore: 14, currentAmount: 500, goalAmount: 6000))
    }
}
