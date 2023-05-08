//
//  enums.swift
//  Easy Portfolio
//
//  Created by Vitaliy Iakushev on 06.05.2023.
//

import Foundation

enum TabType: Int, CaseIterable {
    case main = 0
    case portfolio
    case about
    
    var tabItem: TabItemData {
        switch self {
        case .main: return TabItemData(image: "profile", selectedImage: "profilefill", title: "Profile")
        case .portfolio: return TabItemData(image: "briefcase", selectedImage: "briefcasefill", title: "Portfolio")
        case .about: return TabItemData(image: "infocircle", selectedImage: "infocirclefill", title: "About")
        }
    }
}
