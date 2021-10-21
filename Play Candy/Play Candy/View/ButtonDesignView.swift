//
//  ButtonDesignView.swift
//  Play Candy
//
//  Created by Manish Yadav on 20/10/21.
//

import SwiftUI

struct ButtonDesignView: View {
    //MARK: - PROPERTIES
    @Binding var isShowButton: Bool
    @State private var expand = true
    @State private var downloadAmount = 0.0
    @State private var button = false
    @State private var buttonCheck = false
    @State private var revExpand = false
    @State private var colorChange = false
    @State private var showSheethere = false
    
    
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                Text("Download \n 30 MB")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(width: expand ? 260: 290, height: expand ? 90: 70)
                    .offset(x: expand ? -20: 2)
                    
                                .padding(.horizontal, 0)
                    .background(Color.green)
                    
                    .clipShape(Capsule())
                                
                    .offset(x: expand ? -20: 2)
                
                
                    .onTapGesture {
                        withAnimation(.linear){
                            self.expand.toggle()
                        }
                        
                }
                    .opacity(buttonCheck ? 0: 1)
                
                if expand {
                    ProgressView("Loading...", value: downloadAmount, total: 100)
                        .progressViewStyle(RoundedRectProgressViewStyle())
                        .onReceive(timer) { _ in
                                        if downloadAmount < 100 {
                                            downloadAmount += 5
                                        }
                                    }
                        .opacity(buttonCheck ? 0 : 1)
                }
                
                
                
                if buttonCheck {
                    Button(action: {
                        withAnimation{
                            self.showSheethere = true
                            print("play is done manish")
                        }
                    }){
                        Text("Play")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .frame(width: revExpand ? 290 : 260, height: revExpand ?  70: 60)
                            .offset(x: revExpand ? 2: -20)
                            
                                     
                            .background(Color.blue)
                            
                            .clipShape(Capsule())
                            .offset(x: revExpand ? 2: -20)
                            .onAppear{
                                withAnimation(.linear){
                                    revExpand = true
                                }
                            }
                            
                    }.offset(x: 20)
                    .overlay(RoundedRectangle(cornerRadius: 40).opacity(colorChange ? 0 : 0.5).offset(x: 20).onAppear{
                        withAnimation(.easeIn(duration: 0.5).repeatForever()){
                            colorChange = true
                        }
                    }
                )
                    
                }
                
                if showSheethere {
                    ViewSheet(showSheet: $showSheethere)
                        .offset(y: -100)
                        .offset(x: 20)
                      
                }
                
                
                
                
            }
            if expand {
                ZStack {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 30, height: 20)
                    .font(.system(size: 40))
                    .opacity(button ? 0: 1)
                    
                    if downloadAmount == 100 {
                       
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.yellow)
                        .frame(width: 30, height: 20)
                        .font(.system(size: 40))
                        .onAppear(perform: {
                            button = true
                            buttonCheck = true
                        })
                        .opacity(revExpand ? 0 : 1)
                    }
                }
            }
        }
    }
}

//MARK: - PREVIEW
struct ButtonDesignView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDesignView(isShowButton: .constant(true))
    }
}
