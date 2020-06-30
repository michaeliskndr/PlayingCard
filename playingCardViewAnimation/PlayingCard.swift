//
//  PlayingCard.swift
//  PlayingCard-StanfordCS193p
//
//  Created by Michael Iskandar on 20/06/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    var suit: Suit
    var rank: Rank
    
    var description: String {
        return "\(suit)\(rank)"
    }
    enum Suit: String, CustomStringConvertible {
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.spades, .hearts, .clubs, .diamonds]
        
        var description: String {
            return rawValue
        }
    }
    
    enum Rank: CustomStringConvertible {
        
        case ace
        //        case face(Kind)
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
                
                //            case .face(Kind.J):
                //                return Kind.J.rawValue
                //            case .face(Kind.Q):
                //                return Kind.Q.rawValue
                //            case .face(Kind.K):
            //                return Kind.K.rawValue
            default: return 0
            }
            
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
//            allRanks += [Rank.face(Kind.J), Rank.face(Kind.Q), Rank.face(Kind.K)]
            allRanks += [Rank.face("J"), Rank.face("Q"), Rank.face("K")]
            return allRanks
        }
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let pips): return String(pips)
            case .face(let kind): return kind
            }
        }
        
    }
    
    //    enum Kind: Int{
    //        case J = 11
    //        case Q = 12
    //        case K = 13
    //    }
    
}

