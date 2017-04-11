//
//  ViewController.swift
//  d06
//
//  Created by Teo Fleming on 4/11/17.
//  Copyright © 2017 Teo Fleming. All rights reserved.
//

import UIKit

class FloatingView: UIView {
    static let colors = [
        UIColor.green.cgColor,
        UIColor.red.cgColor,
        UIColor.blue.cgColor,
        UIColor.yellow.cgColor,
        UIColor.black.cgColor,
        UIColor.purple.cgColor,
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let circleIfOne = Int(arc4random_uniform(UInt32(2)))
        if circleIfOne == 1 {
            layer.cornerRadius = frame.size.width/2
            clipsToBounds = true
        }
        
        let colorIndex = Int(arc4random_uniform(UInt32(FloatingView.colors.count)))
        layer.backgroundColor = FloatingView.colors[colorIndex]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    let dynamicAnimator = UIDynamicAnimator()
    let gravityBehavior = UIGravityBehavior()
    
    override func viewDidLoad() {
        gravityBehavior.magnitude = 20
        dynamicAnimator.addBehavior(gravityBehavior)
    }
    
    @IBAction func tapped(_ touch: UITapGestureRecognizer) {
        let point = touch.location(in: self.view)
        print("tapped at", point)
        
        let newView = FloatingView(frame: CGRect(x: point.x - 50, y: point.y - 50, width: 100, height: 100))
        
        gravityBehavior.addItem(newView)
        
        self.view.addSubview(newView)
    }
}

