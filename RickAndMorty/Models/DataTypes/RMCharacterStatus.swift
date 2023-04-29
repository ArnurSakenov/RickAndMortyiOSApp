//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 28.04.2023.
//

import Foundation
enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
