//
//  PullDown.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 11/05/22.
//

import UIKit
import RxSwift

enum PullDownIcon: String {
    case location = "location"
    case calendar = "Calendar"
    case spacecraftClass = "shuttle"
    case launch = "launch"
}

class PullDown: UIView {
    // MARK: - Constants
    fileprivate let indexSelectedSubject = PublishSubject<Int>()
    
    // MARK: - Variables
    var indexSelectedSubjectObservable: Observable<Int> {
        return indexSelectedSubject.asObserver()
    }
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "Disabled")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let pullDownButton: UIButton = {
        let button = UIButton()
        button.showsMenuAsPrimaryAction = true
        
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.contentHorizontalAlignment = .leading
        button.setTitleColor(UIColor(named: "Text"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate let viewPullDownAux: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "White")
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewImageAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let viewLineAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Disabled")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate func setButtonTitle(to text: String) {
        self.pullDownButton.setTitle(text, for: .normal)
    }
    
    // MARK: - Setup
    func setupV(actions: [String], labelValue: String, icon: PullDownIcon) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.image = UIImage(named: icon.rawValue)
        self.labelTitle.text = labelValue
        self.pullDownButton.setTitle(actions[0], for: .normal)
        setupAction(to: actions)
        
        buildHierarchy()
        buildConstraints()
    }
    
    fileprivate func setupAction(to actionTitles: [String]) {
        var allAction: [UIAction] = []
        for (index, title) in actionTitles.enumerated() {
            let newAction = UIAction(title: title) { _ in
                self.setButtonTitle(to: title)
                self.indexSelectedSubject.onNext(index)
            }
            allAction.append(newAction)
        }
        pullDownButton.menu = UIMenu(title: "", children: allAction)
    }

    // MARK: - Methods
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        stackBase.addArrangedSubview(labelTitle)
        stackBase.addArrangedSubview(viewPullDownAux)
        
        viewPullDownAux.addSubview(viewImageAux)
        viewImageAux.addSubview(imageView)
        viewPullDownAux.addSubview(viewLineAux)
        viewLineAux.addSubview(viewLine)
        
        viewPullDownAux.addSubview(pullDownButton)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            self.heightAnchor.constraint(equalToConstant: 77),
            viewPullDownAux.heightAnchor.constraint(equalToConstant: 55),
            
            viewImageAux.topAnchor.constraint(equalTo: viewPullDownAux.topAnchor),
            viewImageAux.leadingAnchor.constraint(equalTo: viewPullDownAux.leadingAnchor, constant: 8),
            viewImageAux.bottomAnchor.constraint(equalTo: viewPullDownAux.bottomAnchor),
            viewImageAux.widthAnchor.constraint(equalToConstant: 25),
            
            imageView.heightAnchor.constraint(equalToConstant: 21),
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.centerXAnchor.constraint(equalTo: viewImageAux.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: viewImageAux.centerYAnchor),
            
            viewLineAux.topAnchor.constraint(equalTo: viewPullDownAux.topAnchor),
            viewLineAux.leadingAnchor.constraint(equalTo: viewImageAux.trailingAnchor),
            viewLineAux.bottomAnchor.constraint(equalTo: viewPullDownAux.bottomAnchor),
            viewLineAux.widthAnchor.constraint(equalToConstant: 15),
            
            viewLine.centerXAnchor.constraint(equalTo: viewLineAux.centerXAnchor),
            viewLine.centerYAnchor.constraint(equalTo: viewLineAux.centerYAnchor),
            viewLine.widthAnchor.constraint(equalToConstant: 2),
            viewLine.heightAnchor.constraint(equalToConstant: 25),
            
            pullDownButton.topAnchor.constraint(equalTo: viewPullDownAux.topAnchor),
            pullDownButton.leadingAnchor.constraint(equalTo: viewLineAux.trailingAnchor),
            pullDownButton.trailingAnchor.constraint(equalTo: viewPullDownAux.trailingAnchor),
            pullDownButton.bottomAnchor.constraint(equalTo: viewPullDownAux.bottomAnchor),
            
        ])
    }
}
