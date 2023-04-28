//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 28.04.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        // Do any additional setup after loading the view.
        let request = RMRequest(endpoint: .character,
        queryParameters: [
        URLQueryItem(name: "name", value: "rick"),
        URLQueryItem(name: "status", value: "alive")
        ])
        RMSerivce.shared.execute(request, expecting: RMCharacter.self) { result in
        }
    }

}
