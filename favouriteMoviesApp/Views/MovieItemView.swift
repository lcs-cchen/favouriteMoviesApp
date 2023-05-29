//
//  MovieItemView.swift
//  favouriteMoviesApp
//
//  Created by Cyrus Chen on 27/5/2023.
//

import SwiftUI

struct MovieItemView: View {
    let name: String
    let genre: String
    let rating: Int
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(name)
                    .font(.title3)
                    .bold()
                Text(genre)
                    .font(.subheadline)
            }
            Spacer()
            Text("\(rating)/5")
                .font(.title)
        }
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(name: "Raiders of the Lost Ark", genre: "Action", rating: 5)
    }
}
