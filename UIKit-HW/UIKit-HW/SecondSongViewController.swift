//
//  SecondSongViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 26.09.2022.
//

import UIKit
import AVFoundation
// Плеер второй песни
class SecondSongViewController: UIViewController {
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var durationSlider: UISlider!
    var player = AVAudioPlayer()
    var activityVC: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        durationSlider.thumbTintColor = .purple
        // MARK: - Add duration slider
        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                                     selector: #selector(sliderDuration), userInfo: nil, repeats: true)
        // MARK: - ActivityController
        shareButton.addTarget(self, action: #selector(openShareMenu), for: .allEvents)
        // MARK: - Add mp3
        do {
            if let audioPath = Bundle.main.path(forResource: "prihodite", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("Error")
        }
    }
    // MARK: - Segue to library
    @IBAction func backToLibraryButton(_ sender: Any) {
        player.stop()
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Play and Pause Button
    @IBAction func playPauseButton(_ sender: Any) {
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
    // MARK: - Method to change track duration
    @IBAction func changeMomentOnTrack(_ sender: Any) {
        player.currentTime = TimeInterval(durationSlider.value)
        player.play()
    }
    @objc func sliderDuration() {
        durationSlider.value = Float(player.currentTime)
    }
    // MARK: - Method open ActivityController
    @objc func openShareMenu() {
        activityVC = UIActivityViewController(activityItems: ["Хиты 90-х!"], applicationActivities: nil)
        present(activityVC!, animated: true, completion: nil)
    }
    @IBAction func nextSong(_ sender: Any) {
        player.stop()
    }
}
