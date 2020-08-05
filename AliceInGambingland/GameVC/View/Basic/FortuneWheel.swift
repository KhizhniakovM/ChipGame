//
//  FortuneWheel.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 31.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

enum SpinningDirection {
    case clockwise, antiClockwise
}

enum MajorDirection {
    case up, down, left, right
}

enum Quadrant {
    case ul, ur, ll, lr
}

class FortuneWheel: UIImageView, CAAnimationDelegate {
    // MARK: - Properties
    private var maxSpeed = 0
    private var majorDirection = MajorDirection.right
    private var quadrant =  Quadrant.ul
    private var spinningDirection = SpinningDirection.clockwise
    
    var result: Color!
    var completion: (() -> Void)?
    
    // MARK: - Methods
    func setupGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(respondToPanGesture))
        addGestureRecognizer(panGesture)
    }

    func spin() {
        startAnimation(speed: Int.random(in: 2000...3000), direction: .clockwise)
    }
    
    private func startAnimation(speed: Int, direction : SpinningDirection) {

        var duration = Double(speed) / 10
        if duration > 5 { duration = 5 }
        if duration < 1 { duration = 1 }

        let multiplier = (direction == .clockwise) ? -1.0 : 1.0
        let normalizedSpeed = Double(speed) / 100 * multiplier

        let goal = (Double((speed * 100) % Int(2 * Double.pi * 100)) / 100.0)

        let anim = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        anim.duration = duration
        anim.isCumulative = true
        anim.values = [NSNumber(value: Float(normalizedSpeed)), Float(goal)]
        anim.keyTimes = [NSNumber(value: Float(0)), NSNumber(value: Float(1))]
        anim.timingFunctions = [CAMediaTimingFunction(name: .easeOut)]
        anim.isRemovedOnCompletion = false
        anim.fillMode = CAMediaTimingFillMode.forwards
        anim.delegate = self
        self.layer.removeAllAnimations()
        self.layer.add(anim, forKey: "rotate")
    }
    
    private func radiansToDegress(radians: CGFloat) -> CGFloat {
        return radians * 180 / .pi
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.isUserInteractionEnabled = false
        
        let transform: CATransform3D = self.layer.presentation()!.transform
        let angle = atan2(transform.m12, transform.m11)
        let testAngle = radiansToDegress(radians: angle)
        
        switch testAngle {
        case -170 ... -150, -130 ... -110, -90 ... -70, -50 ... -30, -10 ... 10, 30 ... 50, 70 ... 90, 110 ... 130, 150 ... 170:
            result = .red
            print("Red")
        default:
            result = .white
            print("White")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.completion!()
        }
    }
    // MARK: - @objc methods
    @objc
    func respondToPanGesture(gesture: UIPanGestureRecognizer) {

        let velocity = gesture.velocity(in: self)

        let vX = abs(velocity.x)
        let vY = abs(velocity.y)
        let speed = Int(vX + vY)

        if speed > maxSpeed { maxSpeed = speed }

        let location = gesture.location(in: self)

        if vX > vY {
            majorDirection = (velocity.x > 0) ? .right : .left
        }
        else {
            majorDirection = (velocity.y > 0) ? .down : .up
        }

        if location.x < self.frame.width / 2 {
            quadrant = (location.y < self.frame.height / 2 ) ? .ul : .ll
        }
        else {
           quadrant = (location.y < self.frame.height / 2 ) ? .ur : .lr
        }

        switch quadrant {
        case .ul:

            switch majorDirection {
            case .down, .left:
                spinningDirection = .antiClockwise
            case .up, .right:
                spinningDirection = .clockwise
            }

        case .ur:

            switch majorDirection {
            case .down, .right:
                spinningDirection = .clockwise
            case .up, .left:
                spinningDirection = .antiClockwise
            }

        case .lr:

            switch majorDirection {
            case .down, .left:
                spinningDirection = .clockwise
            case .up, .right:
                spinningDirection = .antiClockwise
            }

        case .ll:
            switch majorDirection {
            case .down, .right:
                spinningDirection = .antiClockwise
            case .up, .left:
                spinningDirection = .clockwise
            }
        }

        if gesture.state == .began {
            maxSpeed = 0
            self.isUserInteractionEnabled = false
        }

        if gesture.state == .ended {
            startAnimation(speed: maxSpeed, direction: spinningDirection)
        }
    }
}
