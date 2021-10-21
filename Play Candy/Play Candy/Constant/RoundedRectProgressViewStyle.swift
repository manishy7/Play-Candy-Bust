//
//  RoundedRectProgressViewStyle.swift
//  AnimationFrame
//
//  Created by Manish Yadav on 19/10/21.
//

import SwiftUI


struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 260, height: 90)
                .foregroundColor(Color.green)
                .overlay(Color.white.opacity(0.5)).cornerRadius(50)
                .offset(x: -20)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 260, height: 90)
                .foregroundColor(Color.green)
                .offset(x: -20)
            Text("Download \n 30 MB")
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .offset(x: 40)
        }
        .padding()
    }
}

