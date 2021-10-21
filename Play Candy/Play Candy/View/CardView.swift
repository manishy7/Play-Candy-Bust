//
//  CardView.swift
//  Play Candy
//
//  Created by Manish Yadav on 18/10/21.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERITES
    
    var animation: Namespace.ID
    
    var item: HomeItems
    
    
    
    //MARK: - BODY
    var body: some View {
        
        ZStack(){
            VStack(alignment: .leading){
                GeometryReader { geometry in
                    HStack {
                            Image(item.logo)
                                .resizable().aspectRatio(contentMode: .fill)
                                
                                .frame(width: 65, height: 65, alignment: .leading)
                                .cornerRadius(10)
                            .shadow(radius: 12)
                            .offset(x: geometry.size.width * -0.08)
                        
                            Text(item.title)
                                .fontWeight(.bold)
                                .font(.system(.largeTitle))
                                .foregroundColor(.white)
                                .shadow(radius: 15)
                                .offset(x: geometry.size.width * -0.08)
                        }
                    .matchedGeometryEffect(id: item.id, in: animation)
                    .padding()
                }
                    
                    Spacer()
                    Button(action: {
                        
                    }){
                        Text("DOWNLOAD")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 80)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: item.overlay, in: animation)
                    }.padding()
                    
            }.padding(.horizontal, 20)
        }.background(Image(item.contentImage).resizable().aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 500).clipped()
                        .matchedGeometryEffect(id: item.contentImage, in: animation))
        
            .frame(width: UIScreen.main.bounds.width - 30, height: 500).clipped().cornerRadius(18)
            .padding(.horizontal, 10)
            .shadow(radius: 12)
                
        
    }
}



