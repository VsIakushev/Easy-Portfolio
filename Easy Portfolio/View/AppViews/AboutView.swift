//
//  AboutView.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About View")
                .bold()
            Text("Asset alocations for all profiles")
            Text("ETF List")
            Text("About ViFinance: Links, Contacts")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
