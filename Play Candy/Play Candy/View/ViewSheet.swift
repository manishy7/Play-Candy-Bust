//
//  ViewSheet.swift
//  AnimationFrame
//
//  Created by Manish Yadav on 20/10/21.
//

import SwiftUI

struct ViewSheet: View {
    
    //MARK: - PROPERTIES
    @Binding var showSheet: Bool

    @State var offset: CGFloat = 0
    @State var showDetails = false
    @State var nextPage: Int = 0
    @State var wallet: Int = 500
    @State var cancelNext = false
    @State var playMusic = false
    @State var textMove = false
    
    
    //MARK: - FUNCTION
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 {
            offset = value.translation.height
        }
    }
    func onEnded(value: DragGesture.Value) {
        if value.translation.height > 0 {
            withAnimation(Animation.easeIn(duration: 0.2)){
                
                let height = UIScreen.main.bounds.height / 3
                if value.translation.height > height / 1.5 {
                    showSheet.toggle()
                }
                offset = 0
            }
            
        }
    }
    
    
    func onCancelNext() -> Bool {
        if nextPage > 4 {
            self.cancelNext = true
            return cancelNext
        }
        return cancelNext
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 12) {
                Capsule().fill(Color.gray)
                    .frame(width: 60, height: 4)
                Text("Candy Bust")
                    .foregroundColor(.gray)
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0){
                        //MARK: - CONDITIONAL 
                        
                        
                            
                        
                        if nextPage == 0 {
                            
                            Text("Welcome")
                                .transition(.scale)
                            
                            Text("Select Your Plan")
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                                .frame(width: 300, height: 75)
                                .transition(.move(edge: .trailing))
                                .padding()
                                .offset(x: textMove ? 0 : 70)
                                .onAppear{
                                    withAnimation(.linear(duration: 0.7)){
                                        self.textMove.toggle()
                                    }
                                }
                                
                        }
 
                            
                        if nextPage == 2 {
                            
                            Prizecircle().transition(.move(edge: .trailing))
                                
                            
                            GeometryReader{ geo in
                                Label("Wallet: \(wallet)", systemImage: "wallet.pass.fill")
                                    .frame(height: 15)
                                    .offset(x: geo.size.width * 0.05)
                                    .transition(.scale)
                                    .padding()
                                
                            }
                            Text("")
                                .padding(.vertical, 5)
                           
                            
                        }

                        if nextPage <= 2{
                            GeometryReader { geo in
                                Button(action: {
                                    withAnimation{
                                        self.showDetails.toggle()
                                        nextPage += 2
                                    }
                                }){
                                    Text("Next")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .frame(width: 290, height: 70)
                                        .background(Color.green)
                                        .clipShape(Capsule())
                                        
                                        .padding()
                                        .opacity(cancelNext ? 0: 1)
                                }.offset(x: geo.size.width * 0.03)
                                    
                                    
                            }
                        }
                        if nextPage > 2 {
                            Text("Ready To Play")
                                .padding()
                                .transition(.scale)
                            Text("OSWALD")
                                .fontWeight(.bold)
                                .font(.system(size: 50))
                                .transition(.scale)
                            
                            Text("").padding(.vertical, 5)
                            
                            GeometryReader { geo in
                                Label("Wallet: 495", systemImage: "wallet.pass.fill")
                                    .offset(x: geo.size.width * 0.05)
                                    
                                Button(action: {
                                    withAnimation{
                                        self.playMusic.toggle()
                                        playSound(sound: "NorthWind", type: "mp3")
                                        nextPage += 2
                                    }
                                }){
                                    Text("Confirm")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .frame(width: 290, height: 70)
                                        .background(Color.black)
                                        .clipShape(Capsule())
                                        
                                        .padding()
                                        .opacity(cancelNext ? 0: 1)
                                }.offset(x: -10, y: 10)
                                    
                                    
                            }
                            
                        }
                    }.padding(.horizontal)
                        .padding(.top, 5)
                        .padding(.bottom)
                      
                      
//
                })
                    .frame(height: UIScreen.main.bounds.height/3)
                
                
            }.padding(.top)
                .background(BlurView().clipShape(CustomCorners(corners: [.topLeft, .topRight])))
                .offset(y: offset)
                .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnded(value:)))
                .offset(y: showSheet ? 0: UIScreen.main.bounds.height)
        }.ignoresSafeArea()
            .background(Color.white.opacity(0).ignoresSafeArea())
            .onTapGesture(perform: {
                withAnimation{
                    showSheet.toggle()
                }
            })
    }
}

//MARK: - PREVIEW
struct ViewSheet_Previews: PreviewProvider {
    static var previews: some View {
        ViewSheet(showSheet: .constant(true))
    }
}
