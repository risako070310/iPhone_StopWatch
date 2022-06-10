//
//  ViewController.swift
//  StopWatch
//
//  Created by Risako Kato on 2022/06/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0
    
    var timer: Timer = Timer()
    
    var hanteiText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        hanteiLabel.text = hanteiText
    }
    
    @objc func up(){
        count = count + 0.01
        
        timeLabel.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count <= 10.2 && count >= 9.8 {
            hanteiText = "PERFECT!!"
        } else if count <= 10.3 && count >= 9.7 {
            hanteiText = "GREAT!!"
        } else if count <= 10.5 && count >= 9.5 {
            hanteiText = "GOOD!!"
        }
        
        hanteiLabel.text = hanteiText
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
        
        self.hantei()
    }
    
    @IBAction func reset(){
        count = 0
        timeLabel.text = "0.0"
        hanteiText = ""
        hanteiLabel.text = hanteiText
        
        if timer.isValid{
            timer.invalidate()
        }
    }
    
}

