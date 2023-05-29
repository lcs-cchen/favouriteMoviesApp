//
//  AddMovieView.swift
//  favouriteMoviesApp
//
//  Created by Cyrus Chen on 28/5/2023.
//
import Blackbird
import SwiftUI

struct AddMovieView: View {
    
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    @State var name = ""
    @State var genre = ""
    @State var rating = 3
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter the movie name", text: $name)
                    .textFieldStyle(.roundedBorder)
                TextField("What is the movie's genre?", text: $genre)
                    .textFieldStyle(.roundedBorder)
                Picker(selection: $rating,
                       label: Text("Picker Name"),
                       content:{
                    Text("☆").tag(1)
                    Text("☆☆").tag(2)
                    Text("☆☆☆").tag(3)
                    Text("☆☆☆☆").tag(4)
                    Text("☆☆☆☆☆").tag(5)
                })
                .pickerStyle(.segmented)
                
                Spacer()
            }
            .padding(5)
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        Task{
                            try await db!.transaction {
                                core in
                                try core.query("""
INSERT INTO MOVIE(
name,
genre,
rating
)
VALUES (
(?),
(?),
(?)
)
""",
                                name,
                                genre,
                                rating)
                            }
                        }
                    }, label:{ Text("Add")
                        
                    })
                }
            }
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
