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
        trend = "giuaPhai"
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
        let rong = self.view.bounds.width
        let dai = self.view.bounds.height
        let cheo = sqrt(rong * rong + dai * dai)
        let beta = dai / cheo
        let alpha = rong / cheo
        let cheo1 = sqrt(rong * rong + dai * dai / 4)
        let beta1 = dai * 0.5 / cheo1
         let alpha1 = rong / cheo1

        
        if trend == "giuaPhai" {
            ball.center = CGPointMake(ball.center.x + L, ball.center.y)
            
        }
        if trend == "trenTrai" {
            ball.center = CGPointMake(ball.center.x - L * alpha1 , ball.center.y - L * beta1)
        }
        if trend == "duoiPhai" {
           
            ball.center = CGPointMake(ball.center.x + L * alpha , ball.center.y + L * beta)
        }
        if trend == "giuaTrai" {
            ball.center = CGPointMake(ball.center.x - L * alpha1 , ball.center.y - L * beta1)
        }

        
    }
    
    func nextTrend() -> String {
        
         ball.transform = CGAffineTransformMakeRotation(radians)
        if (self.trend == "giuaPhai") && (ball.center.x + L > self.view.bounds.size.width - ballRadious) {
            return "trenTrai"
        }
        if (self.trend == "trenTrai") && (ball.center.x - L < ballRadious) {
            return "duoiPhai"
        }
        if (self.trend == "duoiPhai") && (ball.center.x + L > self.view.bounds.size.width - ballRadious) {
            return "giuaTrai"
        }
        if (self.trend == "giuaTrai") && (ball.center.x - L < ballRadious) {
            return "giuaPhai"
        }

        return self.trend
        
    }
    
    func rollBall() {
        radians = radians + deltaAngle
        trend = nextTrend()
        runBall(trend)
    }



}

