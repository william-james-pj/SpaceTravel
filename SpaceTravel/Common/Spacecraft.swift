//
//  Spacecraft.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 10/05/22.
//

import UIKit

enum SpacecraftType: CaseIterable {
    case millennium
    case xwing
    case enterprise
}

class Spacecraft: UIView {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewImageAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewSpacecraft: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let labelName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 2
        label.textColor = UIColor(named: "White")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonSelect: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        self.backgroundColor = UIColor(named: "Card")
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 16
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    func selectView() {
        self.backgroundColor = UIColor(named: "Primary")
    }
    
    func deselectView() {
        self.backgroundColor = UIColor(named: "Card")
    }
    
    func configCell(name: String, type: SpacecraftType) {
        self.labelName.text = name
        
        switch type {
        case .millennium:
            imageViewSpacecraft.image = UIImage(named: "Millennium")
        case .enterprise:
            imageViewSpacecraft.image = UIImage(named: "Enterprise")
        case .xwing:
            imageViewSpacecraft.image = UIImage(named: "Xwing")
        }
    }
    
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(viewImageAux)
        stackBase.addArrangedSubview(labelName)
        stackBase.addArrangedSubview(viewStackAux)
        
        viewImageAux.addSubview(imageViewSpacecraft)
        
        self.addSubview(buttonSelect)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            buttonSelect.topAnchor.constraint(equalTo: self.topAnchor),
            buttonSelect.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonSelect.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonSelect.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            viewImageAux.heightAnchor.constraint(equalToConstant: 40),
            imageViewSpacecraft.heightAnchor.constraint(equalToConstant: 21),
            imageViewSpacecraft.widthAnchor.constraint(equalToConstant: 27),
            imageViewSpacecraft.centerXAnchor.constraint(equalTo: viewImageAux.centerXAnchor),
            imageViewSpacecraft.bottomAnchor.constraint(equalTo: viewImageAux.bottomAnchor),
        ])
    }
    
}
