//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Arnur Sakenov on 29.04.2023.
//

import UIKit
import SnapKit
// Single cell for a character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18,weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16,weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView,nameLabel,statusLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addConstraints(){
        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.equalTo(super.snp.left).offset(5)
            make.right.equalTo(super.snp.right).offset(-5)
            make.bottom.equalTo(super.snp.bottom).offset(-3)
        }
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.equalTo(super.snp.left).offset(5)
            make.right.equalTo(super.snp.right).offset(-5)
            make.bottom.equalTo(statusLabel.snp.top).offset(-3)
        }
        imageView.snp.makeConstraints { make in
            make.left.equalTo(super.snp.left)
            make.right.equalTo(super.snp.right)
            make.top.equalTo(super.snp.top)
            make.bottom.equalTo(nameLabel.snp.top).offset(-3)
        }
        imageView.backgroundColor = .green
        nameLabel.backgroundColor = .red
        statusLabel.backgroundColor = .orange
    }
     override func prepareForReuse() {
        super.prepareForReuse()
         imageView.image = nil
         nameLabel.text = nil
         statusLabel.text = nil
    }
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage {[weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
