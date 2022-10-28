//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 조용현 on 2022/10/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    @IBAction func slideChanged(_ sender: UISlider) {
        number = Int(sender.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        self.view.isUserInteractionEnabled = false
        timer?.invalidate()
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomeThingAfter1Seconds), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            if number > 0 {
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                slider.value = 0.5
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                self.view.isUserInteractionEnabled = true
            }
        }
    }
    
//    @objc func doSomeThingAfter1Seconds() {
//        if number > 0 {
//            number -= 1
//            slider.value = Float(number) / Float(60)
//            mainLabel.text = "\(number) 초"
//
//        } else {
//            number = 0
//            mainLabel.text = "초를 선택하세요"
//            timer?.invalidate()
//            AudioServicesPlayAlertSound(SystemSoundID(1322))
//            self.view.isUserInteractionEnabled = true
//
//    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        slider.setValue(0.5, animated: true)
        mainLabel.text = "초를 선택하세요"
//        slider.value = 0.5
        number = 0
        timer?.invalidate()
    }
    
    
}

