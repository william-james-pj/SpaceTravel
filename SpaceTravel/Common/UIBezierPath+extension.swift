//
//  UIBezierPath+extension.swift
//  SpaceTravel
//
//  Created by Pinto Junior, William James on 11/05/22.
//

import UIKit

class Octagon: UIView {
    let lineWidth: CGFloat = 5.0

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
        let path = UIBezierPath(roundedPolygonPathWithRect: self.bounds, lineWidth: lineWidth, sides: 6, cornerRadius: 12)
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = lineWidth

        shape.strokeColor = UIColor(hue: 0.786, saturation: 0.79, brightness: 0.53, alpha: 1.0).cgColor
        shape.fillColor = UIColor(hue: 0.786, saturation: 0.15, brightness: 0.89, alpha: 1.0).cgColor
        self.layer.addSublayer(shape)
        
        let border = CAShapeLayer()
        border.path = path.cgPath
        border.lineWidth = lineWidth
        border.strokeColor = UIColor.black.cgColor
        border.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(border)
    }
}


extension UIBezierPath {
    convenience init(roundedPolygonPathWithRect rect: CGRect, lineWidth: CGFloat, sides: NSInteger, cornerRadius: CGFloat) {
        self.init()

        let theta = CGFloat(2.0 * Double.pi) / CGFloat(sides)
        let offSet = CGFloat(cornerRadius) / CGFloat(tan(theta/2.0))
        let squareWidth = min(rect.size.width, rect.size.height)

        var length = squareWidth - lineWidth

        if sides%4 != 0 {
            length = length * CGFloat(cos(theta / 2.0)) + offSet/2.0
        }
        let sideLength = length * CGFloat(tan(theta / 2.0))

        var point = CGPoint(x: squareWidth / 2.0 + sideLength / 2.0 - offSet, y: squareWidth - (squareWidth - length) / 2.0)
        var angle = CGFloat(Double.pi)
        move(to: point)

        for _ in 0 ..< sides {
            point = CGPoint(x: point.x + CGFloat(sideLength - offSet * 2.0) * CGFloat(cos(angle)), y: point.y + CGFloat(sideLength - offSet * 2.0) * CGFloat(sin(angle)))
            addLine(to: point)

            let center = CGPoint(x: point.x + cornerRadius * CGFloat(cos(angle + CGFloat(Double.pi / 2))), y: point.y + cornerRadius * CGFloat(sin(angle + CGFloat(Double.pi / 2))))
            addArc(withCenter: center, radius:CGFloat(cornerRadius), startAngle:angle - CGFloat(Double.pi / 2), endAngle:angle + theta - CGFloat(Double.pi / 2), clockwise:true)

            point = currentPoint
            angle += theta
        }

        close()
    }
}
