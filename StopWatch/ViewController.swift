//
//  ViewController.swift
//  StopWatch
//
//  Created by Risako Kato on 2022/06/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    var count: Float = 0
    
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        
        timeLabel.text = String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
        }
    }

    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
        }
    }
    
    @IBAction func reset(){
        count = 0
        timeLabel.text = "0.0"
        
        if timer.isValid{
            timer.invalidate()
        }
    }
    
}

