//
//  ShooesViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 01.10.2022.
//

import UIKit
// Экран для выбора картинки и вызова Activity
class ShooesViewController: UIViewController {
    @IBOutlet weak var fileButton: UIButton!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var fireButton: UIButton!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        fileButton.addTarget(self, action: #selector(copyTextAndImageFileAction), for: .allTouchEvents)
        trashButton.addTarget(self, action: #selector(copyTextAndImageFireAction), for: .allTouchEvents)
        fireButton.addTarget(self, action: #selector(copyTextAndImageTrashAction), for: .allTouchEvents)
    }
    @objc func copyTextAndImageFileAction() {
        let activityVC = UIActivityViewController(activityItems: [text, fileButton.currentImage ?? ""], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    @objc func copyTextAndImageTrashAction() {
        let activityVC = UIActivityViewController(activityItems: [text, trashButton.currentImage ?? ""], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
}
    @objc func copyTextAndImageFireAction() {
        let activityVC = UIActivityViewController(activityItems: [text, fireButton.currentImage ?? ""], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}
