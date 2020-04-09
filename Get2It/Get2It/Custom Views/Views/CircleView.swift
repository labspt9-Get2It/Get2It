//
//  CircleView.swift
//  Get2It
//
//  Created by Vici Shaweddy on 4/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class CircleView: UIView {
    private let trackLayer = CAShapeLayer()
    private var didAnimate = false
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 18, height: 18)
    }
    
    init() {
        super.init(frame: .zero)
        
        let center = CGPoint(x: 18, y: 18)
        
        // circle
        let circularPath = UIBezierPath(arcCenter: center, radius: 13, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        self.trackLayer.path = circularPath.cgPath

        self.trackLayer.strokeColor = UIColor.gray.cgColor
        self.trackLayer.lineWidth = 2
        self.trackLayer.lineCap = CAShapeLayerLineCap.round
        self.trackLayer.fillColor = UIColor.clear.cgColor

        self.layer.addSublayer(self.trackLayer)
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

