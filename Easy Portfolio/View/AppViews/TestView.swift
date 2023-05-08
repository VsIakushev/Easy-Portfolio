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
    
    var body: some View {
        VStack {
            Text(viewModel.riskToleranceQuestions[currentQuestionIndex].text)
                .font(.title)
                .padding()
            
            ForEach(viewModel.riskToleranceQuestions[currentQuestionIndex].answers, id: \.text) { answer in
                Button(action: {
                    self.totalScore += answer.score
                    if self.currentQuestionIndex < self.viewModel.riskToleranceQuestions.count - 1 {
                        self.currentQuestionIndex += 1
                    } else {
                        print(totalScore)
                        viewModel.saveRiskScore()
                        showPassedAlert = true
                        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                            showPassedAlert = false
                        }
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                }) {
                    Text(answer.text)
                        .font(.headline)
                        .padding()
                }
            }
            
            Text("Total score: \(totalScore)")
                .font(.title)
                .padding()
        }
        .alert(isPresented: $showPassedAlert) {
            Alert(title: Text("Test is Complete!"), message: Text("Your Risk Score saved. Now You can create Portfolio"), dismissButton: .default(Text("OK")))
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
