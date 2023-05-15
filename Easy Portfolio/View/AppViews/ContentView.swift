//
//  ContentView.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

// добавить смену экранов по свайпу (делал в ксеоме)

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            MainTabView()
        }
        .padding(.bottom)
        .edgesIgnoringSafeArea(.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
