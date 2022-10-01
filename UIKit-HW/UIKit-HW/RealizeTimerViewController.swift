//
//  RealizeTimerViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 01.10.2022.
//

import UIKit
// Реализован таймер
final class RealizeTimerViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var stopView: UIView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    // MARK: - Public propertys
    var timer = Timer()
    var isTimeRunning = false
    var seconds = 0
    var minuties = 0
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        runSecondsTimer()
    }
    // MARK: - Public methods
    func configUI() {
        stopView.layer.cornerRadius = 0.5 * stopView.bounds.size.width
        stopButton.layer.cornerRadius = 0.5 * stopButton.bounds.size.width
        stopButton.layer.borderColor = UIColor.black.cgColor
        stopButton.layer.borderWidth = 2
        stopButton.addTarget(self, action: #selector(returnToTimerMenu), for: .touchUpOutside)
    }
    func runSecondsTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSecondsTimer), userInfo: nil, repeats: true)
        isTimeRunning = true
    }
    @objc func updateSecondsTimer() {
        if seconds < 1 {
            timer.invalidate()
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let minuties = minuties
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i", minuties, seconds)
    }

    @objc func returnToTimerMenu() {
        dismiss(animated: true, completion: nil)
    }
}
