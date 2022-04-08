//
//  ProgramCollectionViewCells.swift
//  Demo-App
//
//  Created by Saravanan Rethinam.
//

import UIKit

class ProgramCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    var titleLabel: DSLabel = {
        let label = DSLabel(.textBody)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.accessibilityIdentifier = "title-label"
        return label
    }()
    
    var releaseYearLabel: DSLabel = {
        let label = DSLabel(.finePrint)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.accessibilityIdentifier = "release-year"
        return label
    }()

    var programImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.accessibilityTraits = .image
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    fileprivate let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "iconMore24"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .darkGray
        return button
    }()
    
    fileprivate lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [programImageView, descriptionStackView])
        stack.axis = .vertical
        return stack
    }()
    
    fileprivate lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, moreButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    fileprivate lazy var descriptionStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleStackView, releaseYearLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        self.setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4))
    }

    func setupUI() {
        contentView.addSubview(verticalStackView)
        setverticalStackViewConstraints()
    }
    
    func setverticalStackViewConstraints() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        descriptionStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }

    func update(withTitle title: String, releaseYear: String,
                imageUrl: String, forAccessId accessId: String) {
        self.isAccessibilityElement = true
        self.accessibilityIdentifier = accessId
        accessibilityLabel = title + releaseYear
        accessibilityTraits = .staticText
        programImageView.setImage(from: imageUrl)
        titleLabel.text = String(format: "Title: %@", title)
        releaseYearLabel.text = String(format: "Year: %@", releaseYear)
        contentView.setNeedsLayout()
        self.accessibilityElementsHidden = title.isEmpty // Disabling accessbility
    }
}
