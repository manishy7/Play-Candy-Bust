//
//  CardHorizontalView.swift
//  Play Candy
//
//  Created by Manish Yadav on 18/10/21.
//

import SwiftUI

struct CardHorizontalView: View {
    //MARK: - PROPERTIES
    var candies = ["Candy1", "candy2", "candy3", "candy4"]
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(candies, id: \.self) { candy in
                    Image(candy)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 300)
                        .cornerRadius(10)
                        .shadow(radius: 12)
                }
            }.padding(20)
        }

    }
}

//MARK: - PREVIEW
struct CardHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        CardHorizontalView()
    }
}
