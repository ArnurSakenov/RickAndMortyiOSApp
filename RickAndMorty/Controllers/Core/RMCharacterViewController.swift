//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 28.04.2023.
//

import UIKit
import SnapKit
final class RMCharacterViewController: UIViewController {
    private let characterListView = RMCharacterListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
    }
    private func setUpView(){
        view.addSubview(characterListView)
        characterListView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }

}
