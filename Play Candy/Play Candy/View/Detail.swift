//
//  Detail.swift
//  Play Candy
//
//  Created by Manish Yadav on 18/10/21.
//

import SwiftUI

struct Detail: View {
    
    //MARK: - PROPERITES
    @State var showButton = false
    @State private var disableButton = false
    @State var viewSheetView = true
    @State var moveCard = false
    
    @ObservedObject var detail: DetailViewModel
    var animation: Namespace.ID

    //MARK: - BODY
    var body: some View {
        ZStack {
            VStack{
                Image(detail.selectedItem.contentImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: detail.selectedItem.contentImage, in: animation)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5).clipped()
                Spacer()
                
                CardHorizontalView()
                    .offset(x: moveCard ? 0: 20)
                    .padding(.vertical, 20)
                    .transition(.scale)
                    .onAppear{
                        withAnimation(.linear(duration: 1.5)){
                            self.moveCard.toggle()
                        }
                    }
                    
    
                Button(action: {
                    showButton.toggle()
                    disableButton = true
                }){
                    Text("\(detail.selectedItem.overlay) \n 30 MB")
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 80)
                        .foregroundColor(Color.white)
                        .frame(width: 290, height: 70)
                        .background(Color.green)
                        .clipShape(Capsule())
                        .matchedGeometryEffect(id: detail.selectedItem.overlay, in: animation)
                        .opacity(disableButton ? 0 : 1)
                        
                }.padding()
                
                if showButton {
                   
                        ButtonDesignView(isShowButton: $showButton)
                        .offset(y: -100)
                    
                }
                
            }
            VStack {
                GeometryReader { geometry in
                    VStack {
                        HStack {
                                Image(detail.selectedItem.logo)
                                    .resizable().aspectRatio(contentMode: .fill)
                                    
                                    .frame(width: 65, height: 65, alignment: .leading)
                                    .cornerRadius(10)
                                .shadow(radius: 12)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 10)
                                .offset(x: geometry.size.width * -0.05)
                            
                                Text(detail.selectedItem.title)
                                    .fontWeight(.bold)
                                    .font(.system(.largeTitle))
                                    .foregroundColor(.white)
                                    .shadow(radius: 15)
                                    .padding(.vertical, 20)
                                    .padding(.horizontal, -10)
                                    .offset(x: geometry.size.width * -0.05)
                            Spacer()
                            Button(action:{
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                                
                                    detail.show.toggle()
                                }
                                
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.black.opacity(0.7))
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            }.padding(.horizontal)
                                
                                
                                
                            }
                        .matchedGeometryEffect(id: detail.selectedItem.id, in: animation)
                    .padding()
                        
                        Text(detail.selectedItem.category)
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                        
                        Text("Read More")
                            .foregroundColor(Color.green)
                            .fontWeight(.bold)
                            
                        
                            
                        
                    }
                }
            }
        }.ignoresSafeArea(.all, edges: .top)
    }
}

