//
//  TabBar.swift
//  Play Candy
//
//  Created by Manish Yadav on 18/10/21.
//

import SwiftUI

struct TabBar: View {
    //MARK: - PROPERTIES
    @Namespace var animation
    @StateObject var detailObject = DetailViewModel()
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            TabView{
                
                Home(animation: animation)
                    .environmentObject(detailObject)
                    .tabItem{
                        Image(systemName: "house.fill")
                            .renderingMode(.template)
                        Text("Home")
                    }
                Text("Games")
                    .tabItem{
                        Image(systemName: "gamecontroller.fill")
                            .renderingMode(.template)
                        Text("Games")
                    }
                Text("Apps")
                    .tabItem{
                        Image(systemName: "square.stack.3d.up.fill")
                            .renderingMode(.template)
                        Text("Apps")
                    }
                Text("Search")
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                            .renderingMode(.template)
                        Text("Search")
                    }
            }//: TOOLBAR
            .opacity(detailObject.show ? 0: 1)
            if detailObject.show {
                Detail(detail: detailObject, animation: animation)
            }
        }
    }
}

//MARK: - PREVIEW
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
