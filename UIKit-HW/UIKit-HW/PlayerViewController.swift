//
//  PlayerViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 26.09.2022.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var timeFromStartLabel: UILabel!
    var player = AVAudioPlayer()
    var activityVC: UIActivityViewController? = nil
    @IBOutlet weak var krugImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        krugImage.layer.cornerRadius = 8
        durationSlider.thumbTintColor = .purple
        // MARK: - Timer and track Slider
        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                                     selector: #selector(sliderDuration), userInfo: nil, repeats: true)
        var _ = Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: #selector(timeIntevalCounter), userInfo: nil, repeats: true)
        shareButton.addTarget(self, action: #selector(openShareMenu), for: .allEvents)
        // MARK: - Add mp3
        do {
            if let audioPath = Bundle.main.path(forResource: "pacany", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("Error")
        }
    }
    // MARK: - Get back to all songs
    @IBAction func backToLibraryButton(_ sender: Any) {
        player.stop()
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Play and Pause Button
    @IBAction func playButton(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
    // MARK: - Doing able to change a moment in song
    @IBAction func changeTimeOfMoment(_ sender: Any) {
        player.currentTime = TimeInterval(durationSlider.value)
        player.play()
    }
    // MARK: - Timer
    @objc func timeIntevalCounter() {
        let currentTime = player.currentTime
        let minuties = Int(currentTime / 60)
        let seconds = Int(currentTime.truncatingRemainder(dividingBy: 60))
        timeFromStartLabel.text = NSString(format: "%02d:%02d", minuties, seconds) as String
    }
    @objc func sliderDuration() {
        durationSlider.value = Float(player.currentTime)
    }
    @objc func openShareMenu() {
        activityVC = UIActivityViewController(activityItems: ["Хиты 90-х!"], applicationActivities: nil)
        present(activityVC!, animated: true, completion: nil)
    }
    @IBAction func nextSong(_ sender: Any) {
        let secondSongVC = SecondSongViewController()
        player.stop()
        secondSongVC.player.play()
    }
}
