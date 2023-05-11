//
//  MainView.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var testViewModel = TestViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
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
                    print(userGoals)
                    print("Xm")
                } label: {
                    Text("test Button")
                        .modifier(MyButtonStyle())
                        .padding(5)
                }

                
                Spacer()
            }
        }
        .onAppear {
            testViewModel.loadUserRiskToleranceScore()
            userGoals = testViewModel.loadGoals()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
