//
//  DetailViewModel.swift
//  Play Candy
//
//  Created by Manish Yadav on 18/10/21.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    @Published var selectedItem = HomeItems(title: "", category: "", overlay: "", contentImage: "", logo: "")
    @Published var show = false
}


