//
//  ViewController.swift
//  BallRoll
//
//  Created by Quan on 6/24/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ballRadious = CGFloat()
    var radians = CGFloat()
    var ball = UIImageView()
    var trend: String!
    let deltaAngle: CGFloat = 0.1
    var L =  CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballRadious = 32.0
        trend = "phai"
        L = ballRadious * deltaAngle
        addBall()
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
    }
    
    func addBall() {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.center = CGPointMake(ballRadious, mainViewSize.height * 0.5)
        self.view.addSubview(ball)
    }
    
    func runBall(trend: String) {
        if trend == "phai" {
            ball.center = CGPointMake(ball.center.x + L, ball.center.y)
        } else {
            ball.center = CGPointMake(ball.center.x - L, ball.center.y)
        }
    }
    
    func nextTrend() -> String {
        if (self.trend == "phai") && (ball.center.x + L > self.view.bounds.size.width - ballRadious) {
            return "trai"
        }
        if (self.trend == "trai") && (ball.center.x - L < ballRadious) {
            return "phai"
        }
        return self.trend
        
    }
    
    func rollBall() {
        radians = radians + deltaAngle
        ball.transform = CGAffineTransformMakeRotation(radians)
        trend = nextTrend()
        runBall(trend)
    }



}

