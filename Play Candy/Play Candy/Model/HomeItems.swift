//
//  HomeItems.swift
//  Play Candy
//
//  Created by Manish Yadav on 18/10/21.
//

import SwiftUI

struct HomeItems: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var category: String
    var overlay: String
    var contentImage: String
    var logo: String
}

var items = [
HomeItems(title: "Candy Burst", category: "Play The Utimate Candy Challenge", overlay: "DOWNLOAD", contentImage: "candySaga", logo: "candyLogo"),
HomeItems(title: "Swift", category: "APPLE", overlay: "DOWNLOAD", contentImage: "orange", logo: "swift")

]
