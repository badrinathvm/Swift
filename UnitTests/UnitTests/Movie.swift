//
//  Movie.swift
//  UnitTests
//
//  Created by Badarinath Venkatnarayansetty on 9/26/17.
//  Copyright © 2017 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation

struct Movie{
    
    var title: String
    var genre: Genre
    
    
    func genreString() -> String {
        switch genre {
        case .Action:
            return "Action"
        case .Animation:
            return "Animation"
        default:
            return "None"
        }
    }
}


enum Genre: Int {
    case Animation
    case Action
    case None
}

