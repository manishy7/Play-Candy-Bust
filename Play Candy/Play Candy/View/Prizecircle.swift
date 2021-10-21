//
//  Prizecircle.swift
//  AnimationFrame
//
//  Created by Manish Yadav on 20/10/21.
//

import SwiftUI

struct Prizecircle: View {
    var body: some View {
        HStack{
            ZStack {
                
                Circle()
                    .frame(width: 70, height: 70)
                .foregroundColor(Color.green)
                Text("5")
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
            }
            
            ZStack {
                
                Circle()
                    .frame(width: 70, height: 70)
                .foregroundColor(Color.gray)
                .padding()
                Text("10")
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
            }
            
            ZStack {
                
                Circle()
                    .frame(width: 70, height: 70)
                .foregroundColor(Color.gray)
                Text("15")
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
            }
        }.padding()
    }
}

struct Prizecircle_Previews: PreviewProvider {
    static var previews: some View {
        Prizecircle()
    }
}
