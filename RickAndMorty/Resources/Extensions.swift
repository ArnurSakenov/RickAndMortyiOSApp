//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 29.04.2023.
//

import UIKit
extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach {
            addSubview($0)
        }
    }
}
