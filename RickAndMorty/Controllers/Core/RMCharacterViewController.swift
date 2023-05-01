//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 28.04.2023.
//

import UIKit
import SnapKit
final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate {
    private let characterListView = RMCharacterListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
    }
    private func setUpView(){
        characterListView.delegate = self
        view.addSubview(characterListView)
        characterListView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never 
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
