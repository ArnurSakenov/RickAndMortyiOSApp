//
//  RMService.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 28.04.2023.
//

import Foundation
final class RMSerivce {
    static let shared = RMSerivce()
    private init () {}
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
