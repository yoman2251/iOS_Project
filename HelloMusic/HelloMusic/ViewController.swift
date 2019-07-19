//
//  ViewController.swift
//  HelloMusic
//
//  Created by sunny on 2019/5/24.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var myPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //找出檔案路徑
        if let path = Bundle.main.path(forResource: "Right", ofType: "mp3") {
        //找出檔案的URL
            let url = URL(fileURLWithPath: path)
            do {
                myPlayer = try AVAudioPlayer(contentsOf: url)
            }catch {
                print(error.localizedDescription)
            }
            
        }
        
    }

    @IBAction func PlayMusic(_ sender: UIButton) {
        myPlayer.stop()
        myPlayer.currentTime = 0
        myPlayer.prepareToPlay()
        myPlayer.play()
    }
    
}

