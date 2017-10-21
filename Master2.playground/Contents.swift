//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 'is' - > Used to check whether an instance of a certain type is sub class type

protocol MediaItem{
    var name: String { get }
}

class Movie: MediaItem{
    var director : String
    
    var name : String
    
    init(name:String, director:String ){
        self.director = director
        self.name = name
    }
}

class Song: MediaItem{
    var name: String
    
    var artist: String
    
    init(name:String , artist: String){
        self.name = name
        self.artist = artist
    }
}

var library:[Any] = []
library.append( Movie(name: "Casablanca", director: "Michael Curtiz"))
library.append(Song(name: "Blue Suede Shoes", artist: "Elvis Presley"))
library.append(Movie(name: "Citizen Kane", director: "Orson Welles"))
library.append(Song(name: "The One And Only", artist: "Chesney Hawkes"))
library.append(Song(name: "Never Gonna Give You Up", artist: "Rick Astley"))
library.append({(name:String) -> String in "Hello \(name)" })


var ( movieCount, songCount) = (0,0)

for item in library{
    
    if item is Movie{
        movieCount += 1
    }else if item is Song{
        songCount += 1
    }
}

print("Movie count \(movieCount)")
print("Song Count \(songCount)")


// DownCasting ( as? ) or ( as! )


// as? - Retunrs teh optional value of the type you are trying to downcast. ( use it when you are not sure )
// as! - Downcats and force unwrap the result ( use when it always succeeds )


for item in library{
    if let movie = item as? Movie{
        print("Movie: \(movie.name), dir. \(movie.director)")
    }else if let song = item as? Song{
         print("Song: \(song.name), by \(song.artist)")
    }
}


let dict = [1:"one", 2:"two", 3:"three", 4: "four", 5:"five"]
let numbers = [23, 45]

let result = numbers.map { (n) -> String in
    var output = ""
    var number = n
    
    repeat{
        output = dict[number%10]! + output
        number = number/10
        
    }while ( number > 0)
    
    
    return output
}

print(result)

var (note, mag) = ("aa","ab")
var cache:[Int] = []

extension Character{
    var asciiValue : Int{
        get{
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}


let indChars = mag.characters.flatMap { $0 }
let noteChars = note.characters.flatMap { $0 }
print(indChars)
print(noteChars)

import Foundation

class RansomeNote {
    
    var dict = [Character:Int]()
    
    func ransomeNote( note : String , magazine: String) -> Bool {
        //print (note)
        
        for chars in magazine.characters{
            if( dict[chars] == nil ){
                dict[chars] = 1
            }else{
                dict[chars]! += 1
            }
        }
        
        for x in note.characters{
            
            if(dict[x]  == nil ){
                return false
            }else if ( dict[x] == 0){
                return false
            }else{
                dict[x]! -= 1
            }
        }
        
        return true
        
    }
    
}

print(RansomeNote().ransomeNote(note: "aa", magazine: "ab"))
print(RansomeNote().ransomeNote(note: "aa", magazine: "aab"))











