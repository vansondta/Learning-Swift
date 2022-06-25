//
//  ViewController.swift
//  MyAudio
//
//  Created by TheLightLove on 26/05/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// kiểm tra cái link path có đúng ko
        guard let path = Bundle.main.path(forResource: "bensoundukulele.mp3", ofType: nil) else {
            return
        }
        
        /// kiểm tra biến url defile có đúng ko
        guard let url = URL(string: path) else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            /// error
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func playAction(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pauseAction(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        player.stop()
    }
    
    
}

