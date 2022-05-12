//
//  HomeViewController.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 09/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    
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
    
    fileprivate let imageViewPlanet: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Planet")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let labelAppName: UILabel = {
        let label = UILabel()
        label.text = "Space Travel"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor(named: "White")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelTrip: UILabel = {
        let label = UILabel()
        label.text = "Trip To Universe"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "White")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let stackHeader: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewImageMarsAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewMars: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Mars")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate let labelChoseSpacecraft: UILabel = {
        let label = UILabel()
        label.text = "Choose Spacecraft"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(named: "White")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let chooseSpacecraft: ChooseSpacecraft = {
        let view = ChooseSpacecraft()
        view.setButtonTitles(buttonTitles: ["Millennium Falcon","X-wing","USS Enterprise"])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewOctagon: Octagon = {
        let view = Octagon()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewButtonAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var buttonStart: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "White")
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor(named: "Text"), for: .normal)
        
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonStartTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate let stackFooter: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Action
    @IBAction func buttonStartTapped() -> Void {
        let searchFlights = SearchFlightsViewController()
        self.navigationController?.pushViewController(searchFlights, animated: true)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        view.backgroundColor = .black
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    
    fileprivate func buildHierarchy() {
        view.addSubview(stackBase)
        
        stackBase.addArrangedSubview(stackHeader)
        stackHeader.addArrangedSubview(viewImageAux)
        stackHeader.addArrangedSubview(labelAppName)
        stackHeader.addArrangedSubview(labelTrip)
        
        viewImageAux.addSubview(imageViewPlanet)
        
        stackBase.addArrangedSubview(viewImageMarsAux)
        viewImageMarsAux.addSubview(imageViewMars)
        stackBase.addArrangedSubview(viewStackAux)
        
        stackBase.addArrangedSubview(stackFooter)
        stackFooter.addArrangedSubview(labelChoseSpacecraft)
        stackFooter.addArrangedSubview(chooseSpacecraft)
        stackFooter.addArrangedSubview(viewButtonAux)

        viewButtonAux.addSubview(buttonStart)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackBase.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackBase.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewImageAux.heightAnchor.constraint(equalToConstant: 26),
            imageViewPlanet.heightAnchor.constraint(equalToConstant: 26),
            imageViewPlanet.widthAnchor.constraint(equalToConstant: 26),
            imageViewPlanet.centerXAnchor.constraint(equalTo: viewImageAux.centerXAnchor),
            imageViewPlanet.centerYAnchor.constraint(equalTo: viewImageAux.centerYAnchor),
            
            viewButtonAux.heightAnchor.constraint(equalToConstant: 62),
            buttonStart.heightAnchor.constraint(equalToConstant: 45),
            buttonStart.widthAnchor.constraint(equalToConstant: 55),
            buttonStart.centerXAnchor.constraint(equalTo: viewButtonAux.centerXAnchor),
            buttonStart.centerYAnchor.constraint(equalTo: viewButtonAux.centerYAnchor),
            
            imageViewMars.heightAnchor.constraint(equalToConstant: 250),
            imageViewMars.widthAnchor.constraint(equalToConstant: 250),
            imageViewMars.centerXAnchor.constraint(equalTo: viewImageMarsAux.centerXAnchor),
            imageViewMars.centerYAnchor.constraint(equalTo: viewImageMarsAux.centerYAnchor),
        ])
    }
}
