//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit

final class TimerViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        startView.layer.cornerRadius = 0.5 * startView.bounds.size.width
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.borderWidth = 1
        startButton.addTarget(self, action: #selector(pressedStartButtonAction), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(pauseStartButtonAction), for: .touchUpInside)
    }
    @objc private func pressedStartButtonAction() {
        guard startButton.currentTitle == "Пауза" else { return }
        startButton.setTitle("Старт", for: .normal)
        
    }
    @objc private func pauseStartButtonAction() {
        guard startButton.currentTitle == "Старт" else { return }
        startButton.setTitle("Пауза", for: .normal)
        
    }
}
