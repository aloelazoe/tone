//
//  AppDelegate.swift
//  tone-swift
//
//  Created by Elkie on 17/02/2020.
//  Copyright © 2020 aloelazoe. All rights reserved.
//

import Cocoa
import AVFoundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var audioPlayer: AVAudioPlayer!
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // init audio player
        initAudioPlayer()
        
        // init status bar
        statusItem.title = "♪𝅘𝅥𝅮♬𝅘𝅥𝅯"
        statusItem.action = #selector(onIconClick(_:))
        
        // play sound
        playSound()
    }
    
    @objc func onIconClick(_ sender: Any?) {
        playSound()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func initAudioPlayer() {
        let sound = Bundle.main.path(forResource: "c4note", ofType: "wav")
        do {
            // i might also initialize it with generated data
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            audioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
    }

    func playSound() {
        audioPlayer?.play()
    }
}
