//
//  MainView.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import SwiftUI

struct ProfileView: View {
    
    var array: [Goal] = [Goal(name: "Goal 1", timeHorizonScore: 14, currentAmount: 300, goalAmount: 5000), Goal(name: "Goal 2", timeHorizonScore: 14, currentAmount: 300, goalAmount: 5000)]
    
    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var testViewModel = TestViewModel()
    @State private var goals: [Goal] = []
    
    @ObservableObject var goalView = 
    
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Text("Profile View")
                        .bold()
                    Text("Questions for risk profiling here")
                    NavigationLink(destination: TestView(questions: testViewModel.riskToleranceQuestions, successNotification: testViewModel.alertRiskTestComplete)) {
                        Text("Risk Profiling Test")
                            .modifier(MyButtonStyle())
                            .padding(5)
                        
                    }
                    NavigationLink(destination: TestView(questions: testViewModel.timeHorizonQuestions, successNotification: testViewModel.alertGoalCreated)) {
                        Text("Create new Goal")
                            .modifier(MyButtonStyle())
                            .padding(5)
                    }
                    
                    Button {
                        
                        print(userRiskToleranceScore)
                        print(GoalManager.shared.userGoals)
                        print("Xm")
                    } label: {
                        Text("test Button")
                            .modifier(MyButtonStyle())
                            .padding(5)
                    }
                    
                }
                // change array to userGoals later
                List(goals) { goal in
                    NavigationLink(destination: GoalDetailsView(goal: goal)) {
                        HStack{
                            
                            Text(goal.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("$ \(String(format: "%.2f", goal.currentAmount))")
                        }
                        .padding(.vertical,10)
                        .foregroundColor(.primary)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .swipeActions {
                        Button {
                            GoalManager.shared.removeGoal(goal: goal)
//                            if let index = userGoals.firstIndex(of: goal) {
//                                userGoals.remove(at: index)
//                                testViewModel.saveGoals(currentQuestionIndex: 0, goals: userGoals)
//                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                    }
                }
                .listStyle(PlainListStyle())
//                .navigationTitle("Goals")
                
                
                Text("Goals?")

                
                Spacer()
            }
        }
        
        .onAppear {
            testViewModel.loadUserRiskToleranceScore()
            goals = GoalManager.shared.userGoals
//            goals = testViewModel.loadGoals()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
