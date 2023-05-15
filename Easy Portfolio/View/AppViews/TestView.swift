//
//  TestView.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import SwiftUI

// edit design, add progressbar

struct TestView: View {
    @StateObject var viewModel = TestViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showPassedAlert = false
    @State private var currentQuestionIndex = 0
    @State private var totalScore = 0
    @State private var goalName: String = ""
    @State private var initialAmount: String = ""
    @State private var finalAmount: String = ""
    
    var questions: [Question]
    var successNotification: [String]
    
    var body: some View {
        
        ScrollView {
            if questions.count < 3 {
                VStack {
//                    Text("Create new Goal")
//                        .font(.title)
                    Text("Please fill in the fields and answer the questions below")
                        .multilineTextAlignment(.center)
                                                .font(.title3)
                        .padding([.top, .leading,. trailing], 5)
                    
                    TextField("Enter new Goal's name", text: $goalName)
                        .modifier(MyTextFieldStyle())
                    
                    TextField("Enter initial (current) amount (in $)", text: $initialAmount)
                        .modifier(MyTextFieldStyle())
                        .keyboardType(.decimalPad)
                    
                    TextField("Enter final Goal amount (in $)" , text: $finalAmount)
                        .modifier(MyTextFieldStyle())
                        .padding(.bottom, 10)
                        .keyboardType(.decimalPad)
                    
                    Divider()
                }
                .padding(.top, 10)
//                .frame(minHeight: 350)
            }
            VStack {
                Text(questions[currentQuestionIndex].text)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .padding([.leading, .trailing], 5)
                
                ForEach(questions[currentQuestionIndex].answers, id: \.text) { answer in
                    Button(action: {
                        self.totalScore += answer.score
                        if self.currentQuestionIndex < questions.count - 1 {
                            self.currentQuestionIndex += 1
                        } else {
                            // Auto-Save and Dismiss
                            print(totalScore)
                            viewModel.saveScore(currentQuestionIndex: currentQuestionIndex, currentScore: totalScore)
                            
                            GoalManager.shared.addNewGoal(currentQuestionIndex: currentQuestionIndex, currentScore: totalScore, goalName: goalName, initialAmount: initialAmount, goalAmount: finalAmount)
                            GoalManager.shared.saveGoals()
//                            viewModel.saveNewGoal(currentQuestionIndex: currentQuestionIndex, currentScore: totalScore, goalName: goalName, initialAmount: initialAmount, goalAmount: finalAmount)
//                            viewModel.saveGoals(currentQuestionIndex: currentQuestionIndex, goals: userGoals)
                            
                            
                            showPassedAlert = true
                            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                                showPassedAlert = false
                            }
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Text(answer.text)
                            .modifier(MyButtonStyle())
                    }
                }
                .padding(5)
                
            }
            .padding(.top, 10)
            
            Spacer()
            Spacer()
        }
        .navigationTitle(questions.count < 3 ? "Create new Goal" : "Risk Tolerance Test")
        
        .gesture(DragGesture().onChanged { _ in
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        })
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .alert(isPresented: $showPassedAlert) {
            Alert(title: Text(successNotification[0]), message: Text(successNotification[1]), dismissButton: .default(Text("OK")))
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(questions: [Question(text: "I would describe my knowledge of investments as:", answers: [
            Answer(text: "None", score: 1),
            Answer(text: "Limited", score: 3),
            Answer(text: "Good", score: 7),
            Answer(text: "Extensive", score: 10),
        ])], successNotification: ["Test is Complete!", "Success"])
    }
}
