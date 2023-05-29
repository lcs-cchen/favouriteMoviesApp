//
//  MovieListView.swift
//  favouriteMoviesApp
//
//  Created by Cyrus Chen on 27/5/2023.
//

import SwiftUI

struct MovieListView: View {
    var body: some View {
        NavigationView{
            List{
                MovieItemView(name: "E.T. the Extra-Terrestial", genre: "Science Fiction", rating: 4)
                MovieItemView(name: "Ferris Beullir's Day Off", genre: "Comedy", rating: 4)
                MovieItemView(name: "Ghostbusters", genre: "Comedy", rating: 5)
            }
            .navigationTitle("Favorite Movie")
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
