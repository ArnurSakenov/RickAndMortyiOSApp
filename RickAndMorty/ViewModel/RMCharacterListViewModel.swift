//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 29.04.2023.
//

import UIKit
final class RMCharacterListViewModel: NSObject {
    
    func fetchCharacters(){
        RMSerivce.shared.execute(
            .listCharactersRequests, expecting: RMGetAllCharactersResponse.self){ result in
            switch result {
            case .success(let model):
                print("Example image url: "+String(model.results.first?.image ?? "No Image"))
            case .failure(let error):
               print("Error: "+String(describing: error))
            }}
    }
}
extension RMCharacterListViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
            return UICollectionViewCell()
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(
            characterName: "Arnur",
            characterStatus: .alive,
            characterImageUrl: URL(string:"https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        )
        cell.configure(with: viewModel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
}
