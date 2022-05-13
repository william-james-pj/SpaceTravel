//
//  TicketCollectionViewCell.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 12/05/22.
//

import UIKit

class TicketCollectionViewCell: UICollectionViewCell {
    // MARK: - Components
    fileprivate let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewStackAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let labelOrigin: UILabel = {
        let label = UILabel()
        label.text = "Earth"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let viewLineHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewLineHeaderAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let labelDestination: UILabel = {
        let label = UILabel()
        label.text = "Mars"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let stackHeader: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let viewLineContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewLineContentAux: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let viewLabelContentAux: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "White")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let labelMonth: UILabel = {
        let label = UILabel()
        label.text = "9 Month"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelClockLeave: UILabel = {
        let label = UILabel()
        label.text = "18:00 ph"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelDateLeave: UILabel = {
        let label = UILabel()
        label.text = "2021/05/25"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor(named: "Disabled")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let stackFooterLeft: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let labelClockArrive: UILabel = {
        let label = UILabel()
        label.text = "09:00 am"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(named: "Text")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let labelDateArrive: UILabel = {
        let label = UILabel()
        label.text = "2022/01/15"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor(named: "Disabled")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let stackFooterRight: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate let stackFooter: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let topPoint = CGPoint(x: viewLineHeaderAux.bounds.minX, y: viewLineHeaderAux.bounds.minY)
        let bottomPoint = CGPoint(x: viewLineHeaderAux.bounds.maxX, y: viewLineHeaderAux.bounds.maxY)
        viewLineHeaderAux.createDashedLine(from: topPoint, to: bottomPoint, color: UIColor(named: "Disabled") ?? .lightGray, strokeLength: 3, gapLength: 3, width: 2)
        
        let topPointContentLeft = CGPoint(x: viewLineContentAux.bounds.minX, y: viewLineContentAux.bounds.minY)
        let bottomPointContentLeft = CGPoint(x: viewLineContentAux.bounds.maxX, y: viewLineContentAux.bounds.maxY)
        viewLineContentAux.createDashedLine(from: topPointContentLeft, to: bottomPointContentLeft, color: UIColor(named: "Disabled") ?? .lightGray, strokeLength: 3, gapLength: 3, width: 2)
    }
    
    // MARK: - Setup
    fileprivate func setupVC() {
        self.layer.cornerRadius = 16
        self.backgroundColor = UIColor(named: "White")
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    fileprivate func buildHierarchy() {
        self.addSubview(stackBase)
        
        stackBase.addArrangedSubview(stackHeader)
        stackHeader.addArrangedSubview(labelOrigin)
        stackHeader.addArrangedSubview(viewLineHeader)
        viewLineHeader.addSubview(viewLineHeaderAux)
        stackHeader.addArrangedSubview(labelDestination)
        
        self.addSubview(viewLineContent)
        viewLineContent.addSubview(viewLineContentAux)
        viewLineContent.addSubview(viewLabelContentAux)
        viewLabelContentAux.addSubview(labelMonth)
        
        stackBase.addArrangedSubview(stackFooter)
        stackFooter.addArrangedSubview(stackFooterLeft)
        stackFooterLeft.addArrangedSubview(labelClockLeave)
        stackFooterLeft.addArrangedSubview(labelDateLeave)
        stackFooter.addArrangedSubview(stackFooterRight)
        stackFooterRight.addArrangedSubview(labelClockArrive)
        stackFooterRight.addArrangedSubview(labelDateArrive)
        
//        stackBase.addArrangedSubview(viewStackAux)
    }
    
    fileprivate func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackBase.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            viewLineContent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewLineContent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewLineContent.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            viewLineHeaderAux.leadingAnchor.constraint(equalTo: viewLineHeader.leadingAnchor),
            viewLineHeaderAux.trailingAnchor.constraint(equalTo: viewLineHeader.trailingAnchor),
            viewLineHeaderAux.heightAnchor.constraint(equalToConstant: 1),
            viewLineHeaderAux.centerYAnchor.constraint(equalTo: viewLineHeader.centerYAnchor),
            
            viewLineContentAux.leadingAnchor.constraint(equalTo: viewLineContent.leadingAnchor),
            viewLineContentAux.trailingAnchor.constraint(equalTo: viewLineContent.trailingAnchor ),
            viewLineContentAux.heightAnchor.constraint(equalToConstant: 1),
            viewLineContentAux.centerYAnchor.constraint(equalTo: viewLineContent.centerYAnchor),
            
            viewLabelContentAux.widthAnchor.constraint(equalToConstant: 70),
            viewLabelContentAux.heightAnchor.constraint(equalToConstant: 30),
            viewLabelContentAux.centerXAnchor.constraint(equalTo: viewLineContent.centerXAnchor),
            viewLabelContentAux.centerYAnchor.constraint(equalTo: viewLineContent.centerYAnchor),
            
            labelMonth.centerXAnchor.constraint(equalTo: viewLabelContentAux.centerXAnchor),
            labelMonth.centerYAnchor.constraint(equalTo: viewLabelContentAux.centerYAnchor),
        ])
    }
}

extension UIView {
    func createDashedLine(from point1: CGPoint, to point2: CGPoint, color: UIColor, strokeLength: NSNumber, gapLength: NSNumber, width: CGFloat) {
        let shapeLayer = CAShapeLayer()

        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineDashPattern = [strokeLength, gapLength]

        let path = CGMutablePath()
        path.addLines(between: [point1, point2])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
