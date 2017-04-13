//
//  GradientBorderView.swift
//  Ogenii
//
//  Created by Ky Nguyen on 4/10/17.
//  Copyright © 2017 Ogenii. All rights reserved.
//

import UIKit


class knGradientBorderButton: UIButton {
    
    var colors: [UIColor] = [.blue, .green]
    var startPoint = CGPoint.zero
    var endPoint = CGPoint(x: 1, y: 1)
    private var cornerRadius: CGFloat = 0
    private var borderWidth: CGFloat = 0
    private var gradientLayer = CAGradientLayer()
    private var backgroundView = UIView()
    
    override var backgroundColor: UIColor? {
        didSet {
            backgroundView.backgroundColor = backgroundColor
        }
    }
    
    convenience init() {
        self.init(frame: .zero)
        setupView()
    }
    
    convenience init(colors: [UIColor] = [], startPoint: CGPoint = .zero, endPoint: CGPoint = CGPoint(x: 0, y: 0)) {
        self.init(frame: .zero)
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        backgroundColor = .white
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    internal func setupView() {
        
        gradientLayer.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map({ return $0.cgColor })
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        layer.insertSublayer(gradientLayer, at: 0)
        
        backgroundView.removeFromSuperview()
        backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(backgroundView, at: 1)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.fill(toView: self, space: UIEdgeInsets(space: borderWidth))
        
        createRoundCorner(cornerRadius)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    override func createRoundCorner(_ radius: CGFloat) {
        cornerRadius = radius
        super.createRoundCorner(radius)
        backgroundView.createRoundCorner(radius - borderWidth)
    }
    
    func createBorder(_ width: CGFloat) {
        borderWidth = width
        setupView()
    }
}

extension UIView {
    
    func createRoundCorner(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}

