//
//  MovieListView.swift
//  favouriteMoviesApp
//
//  Created by Cyrus Chen on 27/5/2023.
//
import Blackbird
import SwiftUI

struct MovieListView: View {
    
    @BlackbirdLiveModels({db in
        try await Movie.read(from: db)
    }) var movies
    
    @State var showingAddMovieView = false
    
    var body: some View {
        NavigationView{
            List(movies.results){ currentMovie in
                MovieItemView(name: currentMovie.name, genre: currentMovie.genre, rating: currentMovie.rating)
            }
            .navigationTitle("Favorite Movie")
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    Button(action: {
                        showingAddMovieView = true
                    }, label:{ Image(systemName: "plus")})
                    .sheet(isPresented: $showingAddMovieView){
                        AddMovieView()
                            .presentationDetents([.fraction(0.3)])
                    }
                }
            }
        }
                    
            }
        }
    


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
