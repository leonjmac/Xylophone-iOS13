//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.isEnabled.toggle()
        fadeButton(sender)
        playSound(inKey: (sender.titleLabel?.text)!)
    }
    
    func playSound(inKey key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func fadeButton(_ btn: UIButton) {
        UIView.animate(withDuration: 1.2, delay: 0.2, options: [.curveEaseInOut, .autoreverse], animations: {
            btn.alpha = 0.5
        }, completion: { finished in
            btn.isEnabled.toggle()
            btn.alpha = 1.0
        })
    }
}
