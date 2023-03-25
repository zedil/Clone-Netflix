//
//  HeroHeaderView.swift
//  netflixClone
//
//  Created by Dilara Şimşek on 25.03.2023.
//

import UIKit

class HeroHeaderView: UIView {
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true //avoid from overflow
        imageView.image = UIImage(named: "trapper")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer() // get two colors and frame
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
