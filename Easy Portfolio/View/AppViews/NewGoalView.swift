//
//  NewGoalView.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 08.05.2023.
//

import SwiftUI

struct NewGoalView: View {
    @StateObject private var testViewModel = TestViewModel()
    
    @State var goalName: String = ""
    @State var initialAmount: String = ""
    
    var body: some View {
        VStack {
            Text("New Goal")
                .font(.title)
            TextField("Enter new Goal's name", text: $goalName)
                .modifier(MyTextFieldStyle())
            
            TextField("Enter initial Portfolio amount", text: $initialAmount)
                .modifier(MyTextFieldStyle())
                .padding(.bottom, 10)
            
            Divider()
            
            TestView(questions: testViewModel.timeHorizonQuestions, successNotification: testViewModel.alertGoalCreated)
            
            Spacer()
        }
        
    }
}

struct NewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        NewGoalView()
    }
}
