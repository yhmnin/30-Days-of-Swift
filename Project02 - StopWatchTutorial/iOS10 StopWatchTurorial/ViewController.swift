//
//  ViewController.swift
//  iOS10 StopWatchTurorial
//
//  Created by 付晓 on 2016/11/8.
//  Copyright © 2016年 付晓. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var counter = 0.0
    var time = Timer()
    var isPlaying = false
    
    
    @IBAction func startButtonDidTouch(_ sender: Any) {
        isPlaying = true
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: Any) {
        time.invalidate()
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        isPlaying = false
        
    }
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        isPlaying = false
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    func updateTimer(){
        counter += 0.1
        timeLabel.text = String(format: "%.1f",counter)
    }
}

