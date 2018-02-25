//
//  TimeController.swift
//  exercite!
//
//  Created by Stephanie Lampotang on 2/25/18.
//  Copyright © 2018 Stephanie Lampotang. All rights reserved.
//

import UIKit

class TimeController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    //var count = 0;
    var seconds = 60
    var milli = 0
    var timer = Timer()
    var isTimerRunning = false
    
    @objc func updateTimer() {
        if(seconds == 0 && milli == 0)
        {
            timer.invalidate()
            timerLabel.text = "00:\(60).\(0)"
        }
        if(milli == 0)
        {
            seconds -= 1
            milli = 10
        }
        milli -= 1
        //if seconds < 10 {timerLabel.text = "00:0\(seconds).\(milli)"}
        //
        //else
        timerLabel.text = "00:\(seconds).\(milli)"
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,   selector: (#selector(TimeController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var exercisetype: UILabel!
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        runTimer()
    }
    
    var resumeTapped = false
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        } else {
            runTimer()
            self.resumeTapped = false
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        milli = 100
        seconds = 60    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
        timerLabel.text = "00:\(seconds).\(milli)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
