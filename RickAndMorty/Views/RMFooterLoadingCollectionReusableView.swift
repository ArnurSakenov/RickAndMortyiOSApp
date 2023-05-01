//
//  RMFooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 01.05.2023.
//

import UIKit
import SnapKit
final class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
    static let identifier = "RMFooterLoadingCollectionReusableView"
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(spinner)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addConstraints() {
        spinner.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.centerX.equalTo(super.snp.centerX)
            make.centerY.equalTo(super.snp.centerY)
        }
    }
    public func startAnimating(){
        spinner.startAnimating()
    }
}
