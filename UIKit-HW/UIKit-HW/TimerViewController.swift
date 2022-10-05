//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Класс реализует таймер
final class TimerViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var stopView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startView: UIView!
    
    // MARK: - Private properties
    private var timer = Timer()
    private var count = 0
    private var timerCounting = false
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        configStart()
        configStop()
    }
    
    private func configStart() {
        startView.layer.cornerRadius = 0.5 * startView.bounds.size.width
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.borderWidth = 1
        startButton.addTarget(self, action: #selector(pressedStartButtonAction),
                              for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startPauseAction),
                              for: .touchUpInside)
    }
    
    private func configStop() {
        stopView.layer.cornerRadius = 0.5 * stopView.bounds.size.width
        stopButton.layer.cornerRadius = 0.5 * stopButton.bounds.size.width
        stopButton.layer.borderColor = UIColor.black.cgColor
        stopButton.layer.borderWidth = 1
        stopButton.addTarget(self, action: #selector(stopTimerAction), for: .touchUpInside)
    }
    
    private func minutiesToSecondsAction(sec: Int) -> (Int, Int, Int) {
        return ((sec / 3600), ((sec % 3600) / 60), ((sec % 3600) % 60))
    }
    
    private func makeTImeIntoString(hours: Int, min: Int, sec: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", min)
        timeString += " : "
        timeString += String(format: "%02d", sec)
        return timeString
    }
    
    @objc private func pressedStartButtonAction() {
        guard startButton.currentTitle == "Старт" else { return startButton.setTitle("Старт", for: .normal)}
        startButton.setTitle("Пауза", for: .normal)
    }
    
    @objc private func timerCounter() -> Void {
        count = count + 1
        let time = minutiesToSecondsAction(sec: count)
        let timeString = makeTImeIntoString(hours: time.0, min: time.1, sec: time.2)
        timerLabel.text = timeString
    }
    
    @objc private func stopTimerAction() {
        count = 0
        timer.invalidate()
        timerLabel.text = makeTImeIntoString(hours: 0, min: 0, sec: 0)
    }
    
    @objc private func startPauseAction() {
        if timerCounting {
            timerCounting = false
            timer.invalidate()
        } else {
            timerCounting = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                         selector: #selector(timerCounter),
                                         userInfo: nil, repeats: true)
        }
    }
}
