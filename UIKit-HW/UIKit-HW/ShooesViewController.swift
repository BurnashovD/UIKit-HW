//
//  ShooesViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 01.10.2022.
//

import UIKit
// Экран для выбора картинки и вызова Activity
class ShooesViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var fileButton: UIButton!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var fireButton: UIButton!
    
    // MARK: - Public properties
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Public methods
    func configUI() {
        fileButton.addTarget(self, action: #selector(copyTextAndImageFileAction), for: .allTouchEvents)
        trashButton.addTarget(self, action: #selector(copyTextAndImageFireAction), for: .allTouchEvents)
        fireButton.addTarget(self, action: #selector(copyTextAndImageTrashAction), for: .allTouchEvents)
    }
    
    // MARK: - Private methods
    @objc private func copyTextAndImageFileAction() {
        let activityVC = UIActivityViewController(activityItems: [text, fileButton.currentImage ?? ""], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    @objc private func copyTextAndImageTrashAction() {
        let activityVC = UIActivityViewController(activityItems: [text, trashButton.currentImage ?? ""], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
}
    
    @objc private func copyTextAndImageFireAction() {
        let activityVC = UIActivityViewController(activityItems: [text, fireButton.currentImage ?? ""], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}
