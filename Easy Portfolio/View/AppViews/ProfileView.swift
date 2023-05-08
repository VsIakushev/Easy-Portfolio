//
//  MainView.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile View")
                    .bold()
                Text("Questions for risk profiling here")
                NavigationLink(destination: TestView()) {
                    Text("Risk Profiling Test")
                }
                NavigationLink(destination: TestView()) {
                    Text("Create new Goal")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
