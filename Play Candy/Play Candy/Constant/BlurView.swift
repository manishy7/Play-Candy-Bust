//
//  BlurView.swift
//  LearnSwiftUI
//
//  Created by Manish Yadav on 16/10/21.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context){
        
    }
}


