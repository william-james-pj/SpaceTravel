//
//  ChooseSpacecraft.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 09/05/22.
//

import UIKit
import RxSwift

class ChooseSpacecraft: UIView {
    // MARK: - Constants
    fileprivate let indexSelectedSubject = PublishSubject<Int>()
    
    // MARK: - Variables
    var indexSelectedSubjectObservable: Observable<Int> {
        return indexSelectedSubject.asObserver()
    }
    
    // MARK: - Constants
    fileprivate let selectorTextColor = UIColor(named: "Write")
    fileprivate let disableTextColor = UIColor(named: "Write")
    fileprivate let selectorViewColor = UIColor(named: "Primary")
    fileprivate let disabeldViewColor = UIColor(named: "Card")
    
    // MARK: - Variables
    fileprivate var buttonElements: [SpacecraftModel] = []
    fileprivate var elementViews: [Spacecraft] = []
    
    // MARK: - Setup
    fileprivate func setupVC() {
        createButton()
        configStack()
    }
    
    // MARK: - Actions
    @IBAction func buttonTapped(sender: UIButton) {
        for (elementIndex, elementView) in elementViews.enumerated() {
            elementView.deselectView()
            if elementView.buttonSelect == sender {
                elementView.selectView()
                self.indexSelectedSubject.onNext(elementIndex)
            }
        }
    }
    
    // MARK: - Methods
    func setButtonTitles(buttonElements: [SpacecraftModel]) {
        self.buttonElements = buttonElements
        self.setupVC()
    }
    
    fileprivate func createButton() {
        self.elementViews = [Spacecraft]()
        self.elementViews.removeAll()
        self.subviews.forEach({$0.removeFromSuperview()})
        for (elementIndex, buttonElement) in buttonElements.enumerated() {
            let view = Spacecraft()
            view.configCell(name: buttonElement.name, speed: buttonElement.speed, type: SpacecraftType.allCases[elementIndex])
            view.buttonSelect.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            elementViews.append(view)
        }
        elementViews[1].selectView()
    }
    
    fileprivate func configStack() {
        let stackBase = UIStackView(arrangedSubviews: elementViews)
        stackBase.axis = .horizontal
        stackBase.spacing = 32
        stackBase.distribution = .fillEqually
        stackBase.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackBase)
        
        NSLayoutConstraint.activate([
            stackBase.heightAnchor.constraint(equalToConstant: 110),
            
            stackBase.topAnchor.constraint(equalTo: self.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
