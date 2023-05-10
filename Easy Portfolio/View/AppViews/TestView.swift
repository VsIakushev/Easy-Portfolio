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
    
    var questions: [Question]
    var successNotification: [String]
    
    var body: some View {
           
            VStack {
                
                Text(questions[currentQuestionIndex].text)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .padding()
                
                ForEach(questions[currentQuestionIndex].answers, id: \.text) { answer in
                    Button(action: {
                        self.totalScore += answer.score
                        if self.currentQuestionIndex < questions.count - 1 {
                            self.currentQuestionIndex += 1
                        } else {
                            print(totalScore)
                            viewModel.saveScore(currentQuestionIndex: currentQuestionIndex)
                            viewModel.saveGoalData(currentQuestionIndex: currentQuestionIndex)
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
                
                Spacer()
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
