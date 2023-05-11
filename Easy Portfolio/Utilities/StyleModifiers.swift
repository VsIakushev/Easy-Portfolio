//
//  StyleModifiers.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 09.05.2023.
//

import SwiftUI

struct MyButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 300)
            .padding(10)
            .background(Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255, opacity: 1.0))
            .cornerRadius(10)
            .shadow(radius: 3)
    }
}
    
struct MyTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
            .textFieldStyle(.roundedBorder)
            .shadow(radius: 3)
    }
}
