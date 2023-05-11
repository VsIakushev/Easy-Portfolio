//
//  TabItemVies.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import SwiftUI

struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(isSelected ? data.selectedImage : data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            
            Spacer().frame(height: 4)
            
            Text(data.title)
                .foregroundColor(isSelected ? .black : .gray)
                .font(.system(size: 14))
        }
    }
}

//struct TabItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabItemView(data: TabItemData(image: Image(systemName: "globe"), selectedImage: Image(systemName: "globe"), title: "TestImage"), isSelected: true)
//    }
//}
