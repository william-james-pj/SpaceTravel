//
//  ResultsViewController.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 12/05/22.
//

import UIKit
import RxSwift

class ResultsViewController: UIViewController {
    // MARK: - Constrants
    fileprivate let resuseIdentifierTicket = "TicketCollectionViewCell"
    let disposeBag = DisposeBag()
    
    // MARK: - Variables
    var viewModel: ResultsViewModel = {
        return ResultsViewModel()
    }()
    fileprivate var allFlight: [TicketModel] = []
    
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Search Flights"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let collectionViewTicket: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        view.backgroundColor = UIColor(named: "Backgroud")
        
        self.viewModel.allFlightBehavior.subscribe(onNext: { allFlights in
            self.allFlight = allFlights
            self.collectionViewTicket.reloadData()
        }).disposed(by: disposeBag)
        
        buildHierarchy()
        buildConstraints()
        setupCollection()
    }
    
    fileprivate func setupCollection() {
        collectionViewTicket.dataSource = self
        collectionViewTicket.delegate = self
        
        collectionViewTicket.register(TicketCollectionViewCell.self, forCellWithReuseIdentifier: resuseIdentifierTicket)
    }
    
    // MARK: - Methods
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        stackBase.addArrangedSubview(labelTitle)
        stackBase.addArrangedSubview(collectionViewTicket)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - extension CollectionViewDelegate
extension ResultsViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - extension CollectionViewDataSource
extension ResultsViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allFlight.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifierTicket, for: indexPath) as! TicketCollectionViewCell
        cell.settingCell(ticket: self.allFlight[indexPath.row])
        return cell
    }
}

// MARK: - extension CollectionViewDelegateFlowLayout
extension ResultsViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 150)
    }
}


