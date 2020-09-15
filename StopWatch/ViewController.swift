//
//  ViewController.swift
//  StopWatch
//
//  Created by maya on 2020/09/15.
//  Copyright © 2020 maya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var result: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        result.text = ""
    }

    @IBAction func start() {
        
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
    }

    @IBAction func stop() {
        if timer.isValid {
            //タイマーを止める
            timer.invalidate()
            //hanteiメソッドの呼び出し
            self.hantei()
        }
    }
    @IBAction func reset() {
        if timer.isValid {
            //stop timer
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format: "%.2f", count)
    }
    
    //@objcはObject-cと互換性を持たせるもの
    @objc func up() {
        count += 0.01
        //小数点以下2桁
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei() {
        if count >= 9.80 && count <= 10.20 {
            result.textColor = UIColor.red
            result.text = "PERFECT!"
        } else if count >= 9.70 && count <= 10.30 {
            result.textColor = UIColor.yellow
            result.text = "GREAT"
        } else if count >= 9.50 && count <= 10.50 {
            result.textColor = UIColor.green
            result.text = "GOOD"
        } else {
            result.textColor = UIColor.blue
            result.text = "BAD"
        }
    }
}

