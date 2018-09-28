import UIKit

// This is a sandbox to experiment with CoderPad's execution capabilities.
// It's a temporary, throw-away session only visible to you.

import Foundation

struct Card {
    let rank:Rank
    let suit:Suit
    
    enum Rank: Int {
        case two = 2
        case three, fout, five , six , seven, eight, ninr, ten
        case Jack, Queen, King, Ace
        
        //this is to get the value of special cards.
        func rankDescription() -> String {
            switch self {
            case .Jack : return "Jack"
            case .Queen: return "Queen"
            case .King: return "King"
            case .Ace: return "Ace"
            default: return String(self.rawValue)
            }
        }
        
        func cardValue() -> Int {
            switch self {
            case .Jack : return 10
            case .Queen : return 10
            case .King: return 10
            case .Ace : return 20
            default: return 5
            }
        }
    }
    
    enum Suit: String {
        case spade = "♤"
        case heart = "♡"
        case diamond = "◇"
        case club = "♧"
    }
}

func generateDeckOfCards() -> [Card]{
    var myDeckOfCards:Array = [Card]()
    let maxRank = Card.Rank.Ace.rawValue
    let aSuit = [Card.Suit.club.rawValue, Card.Suit.diamond.rawValue, Card.Suit.heart.rawValue, Card.Suit.spade.rawValue]
    
    for count in 2...maxRank {
        for suit in aSuit {
            let aRank = Card.Rank.init(rawValue: count)
            let aSuit = Card.Suit.init(rawValue: suit)
            let myCard = Card(rank: aRank!,suit: aSuit!)
            myDeckOfCards.append(myCard)
        }
    }
    
    return myDeckOfCards
}

var deckOne = generateDeckOfCards()
var singleCard = deckOne[51]

func cardPlayingInfo(singleCard: Card) -> (name: String , emoji: String , Points: Int) {
    let name = singleCard.rank.rankDescription()
    let emoji = singleCard.suit.rawValue
    let points = singleCard.rank.rawValue
    return (name,emoji, points)
}

cardPlayingInfo(singleCard: singleCard)

