//
//  Movie.swift
//  favouriteMoviesApp
//
//  Created by Cyrus Chen on 28/5/2023.
//

import Foundation
import Blackbird

struct Movie: BlackbirdModel{
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var name: String
    @BlackbirdColumn var genre: String
    @BlackbirdColumn var rating: Int
}
