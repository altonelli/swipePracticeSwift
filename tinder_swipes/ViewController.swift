//
//  ViewController.swift
//  tinder_swipes
//
//  Created by Arthur Tonelli on 7/1/16.
//  Copyright © 2016 Arthur Tonelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 50, 200, 100))
        label.text = "Drag Me!"
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
        
        let gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
        label.addGestureRecognizer(gesture)
        
        label.userInteractionEnabled = true
        
    }
    
    func wasDragged(gesture: UIPanGestureRecognizer){
        let translation = gesture.translationInView(self.view)
        let label = gesture.view!
        
        label.center = CGPoint(x: self.view.bounds.width / 2 + translation.x, y: self.view.bounds.height / 2 + translation.y)
        
        let xFromCenter = label.center.x - self.view.bounds.width / 2
        
        let scale = min(100 / abs(xFromCenter), 1)
        
        var rotation = CGAffineTransformMakeRotation(xFromCenter / 200)
        
        var stretch = CGAffineTransformScale(rotation, 0.9, 0.9)
        
        label.transform = stretch
        
        if gesture.state == UIGestureRecognizerState.Ended {
            
            if label.center.x < 100 {
                print("Not Chosen")
                label.backgroundColor = UIColor(red: 0.3098, green: 0.7176, blue: 0, alpha: 1.0)
                
            } else if label.center.x > self.view.bounds.width - 100 {
                print("Chosen")
                label.backgroundColor = UIColor(red: 0.698, green: 0, blue: 0, alpha: 1.0)
            } else {
                label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            }
            
            rotation = CGAffineTransformMakeRotation(0)
            
            stretch = CGAffineTransformScale(rotation, 1, 1)
            
            label.transform = stretch
            
//            label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            
            label.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

