//
//  ViewController.swift
//  VisualEffects
//
//  Created by Mac on 6/4/18.
//  Copyright © 2018 Amir. All rights reserved.
//

import UIKit

class VisualEffectVC: UIViewController {

    @IBOutlet var addItemView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        addItemView.layer.cornerRadius = 5.0
        
    }
    
    func animateIn(){
        self.view.addSubview(addItemView)
        
        addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            
            self.visualEffectView.effect = nil
        }) { (success) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    
    @IBAction func btnAddPressed(_ sender: Any) {
        animateIn()
    }
    @IBAction func btnDonePressed(_ sender: Any) {
        animateOut()
    }
    
}

