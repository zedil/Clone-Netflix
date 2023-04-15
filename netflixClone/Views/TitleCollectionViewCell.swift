//
//  TitleCollectionViewCell.swift
//  netflixClone
//
//  Created by Dilara Şimşek on 15.04.2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureContents()
    }
    
    private func addSubViews() {
        contentView.addSubview(posterImageView)
    }
    
    private func configureContents() {
        posterImageView.frame = contentView.bounds
    }
    
    /// third party package added which name SDWebImage
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
}
