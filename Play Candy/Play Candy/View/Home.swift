//
//  Home.swift
//  Play Candy
//
//  Created by Manish Yadav on 18/10/21.
//

import SwiftUI

struct Home: View {
    //MARK: - PROPERITES
    var animation: Namespace.ID
    @EnvironmentObject var detail : DetailViewModel
    
    //MARK: - BODY
    var body: some View {
        ScrollView {
            VStack{
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading){
                        Text("Play")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                    }
                }//: HSTACL
                .padding()
                //FOR EACH
                
                ForEach(items){item in
                    
                    CardView(animation: animation, item: item)
                        .padding(.vertical, 10)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                                detail.selectedItem = item
                                detail.show.toggle()
                            }
                        }
                   
                    
                }
                
                
                
                
                
                
        
            }//: VSTACK
            
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
    }
}


