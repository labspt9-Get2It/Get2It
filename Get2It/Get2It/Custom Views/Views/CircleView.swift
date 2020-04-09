//
//  CircleView.swift
//  Get2It
//
//  Created by Vici Shaweddy on 4/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class CircleView: UIView {
    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    private var didAnimate = false
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 36, height: 36)
    }
    
    init() {
        super.init(frame: .zero)
        
        let center = CGPoint(x: 18, y: 18)
        
        // track
        let circularPath = UIBezierPath(arcCenter: center, radius: 13, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        self.trackLayer.path = circularPath.cgPath
        
        self.trackLayer.strokeColor = UIColor(red: 255/255, green: 129/255, blue: 209/255, alpha: 0.3).cgColor
        self.trackLayer.lineWidth = 5
        self.trackLayer.lineCap = CAShapeLayerLineCap.round
        self.trackLayer.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(self.trackLayer)
        
        // circle
        self.shapeLayer.path = circularPath.cgPath
        self.shapeLayer.strokeStart = 0
        self.shapeLayer.strokeColor = UIColor(red: 255/255, green: 129/255, blue: 209/255, alpha: 1).cgColor
        self.shapeLayer.lineWidth = 5
        self.shapeLayer.lineCap = CAShapeLayerLineCap.round
        self.shapeLayer.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(self.shapeLayer)
    }
    
    func animateProgressBar(progress: CGFloat) {
        if self.didAnimate {
            self.shapeLayer.strokeStart = 0
            self.shapeLayer.strokeEnd = progress
            return
        }
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.fromValue = 0
        basicAnimation.toValue = progress
        basicAnimation.duration = 1
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        self.shapeLayer.add(basicAnimation, forKey: "progressAnimation")
        self.didAnimate = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

