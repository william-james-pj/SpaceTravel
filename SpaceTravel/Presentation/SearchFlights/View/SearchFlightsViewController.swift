//
//  SearchFlightsViewController.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 11/05/22.
//

import UIKit

class SearchFlightsViewController: UIViewController {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Search Flights"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let buttonPullDownOrigin: PullDown = {
        let button = PullDown()
        button.setupV(actions: ["Earth", "Mars"], labelValue: "Origin", icon: .location)
        return button
    }()
    
    fileprivate let buttonPullDownDestination: PullDown = {
        let button = PullDown()
        button.setupV(actions: ["Earth", "Mars"], labelValue: "Destination", icon: .location)
        return button
    }()
    
    fileprivate let stackRowDestination: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let buttonPullDownLaunch: PullDown = {
        let button = PullDown()
        button.setupV(actions: ["New Jersey, SpaceX Launch"], labelValue: "Launch Station", icon: .launch)
        return button
    }()
    
    fileprivate let buttonPullDownClass: PullDown = {
        let button = PullDown()
        button.setupV(actions: ["Vip Clean"], labelValue: "Spacecraft Class", icon: .spacecraftClass)
        return button
    }()
    
    fileprivate let buttonPullDownDeparture: PullDown = {
        let button = PullDown()
        button.setupV(actions: ["2021/05/19"], labelValue: "Departure Date", icon: .calendar)
        return button
    }()
    
    fileprivate let stackRowDeparture: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let stackForm: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewButtonAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var buttonSearch: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Text")
        button.setTitle("Search Flight", for: .normal)
        button.setTitleColor(UIColor(named: "White"), for: .normal)
        
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
//        button.addTarget(self, action: #selector(buttonStartTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }

    // MARK: - Setup
    fileprivate func setupVC() {
        view.backgroundColor = UIColor(named: "Backgroud")
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(labelTitle)
        stackBase.addArrangedSubview(buttonPullDownOrigin)
        
        stackBase.addArrangedSubview(stackForm)
        
        stackForm.addArrangedSubview(stackRowDestination)
        stackRowDestination.addArrangedSubview(buttonPullDownOrigin)
        stackRowDestination.addArrangedSubview(buttonPullDownDestination)
        
        stackForm.addArrangedSubview(buttonPullDownLaunch)
        
        stackForm.addArrangedSubview(stackRowDeparture)
        stackRowDeparture.addArrangedSubview(buttonPullDownClass)
        stackRowDeparture.addArrangedSubview(buttonPullDownDeparture)
        
        stackBase.addArrangedSubview(viewButtonAux)
        viewButtonAux.addSubview(buttonSearch)
        
        stackBase.addArrangedSubview(viewStackAux)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewButtonAux.heightAnchor.constraint(equalToConstant: 50),
            buttonSearch.widthAnchor.constraint(equalToConstant: 140),
            buttonSearch.heightAnchor.constraint(equalToConstant: 50),
            buttonSearch.centerXAnchor.constraint(equalTo: viewButtonAux.centerXAnchor),
            buttonSearch.centerYAnchor.constraint(equalTo: viewButtonAux.centerYAnchor),
        ])
    }

}
