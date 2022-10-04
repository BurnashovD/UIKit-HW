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
    
    // MARK: - Public methods
    var seconds = 0
    var minuties = 0
    
    // MARK: - Private propertys
    private var timer = Timer()
    private var isTimeRunning = false
    
    // MARK: - LifeCycle
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
        stopButton.addTarget(self, action: #selector(returnToTimerMenuAction), for: .touchUpOutside)
    }
    
    // MARK: - Private methods
    private func runSecondsTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSecondsTimerAction), userInfo: nil, repeats: true)
        isTimeRunning = true
    }
    
    private func timeString(time: TimeInterval) -> String {
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i", minuties, seconds)
    }
    
    @objc private func updateSecondsTimerAction() {
        if seconds < 1 {
            timer.invalidate()
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    @objc private func returnToTimerMenuAction() {
        dismiss(animated: true, completion: nil)
    }
}
