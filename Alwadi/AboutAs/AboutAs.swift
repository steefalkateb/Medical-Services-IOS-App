//
//  AboutAs.swift
//  Alwadi
//
//  Created by MacBookPro on 12/1/21.
//

import UIKit
import AVKit

class AboutAs: UIViewController {
    @IBOutlet weak var video_view: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //        https://medium.com/@codegradients/play-videos-in-ios-using-avplayerviewcontroller-7c8d92a82e16
                if let url = URL(string:  "https://kalansarigroup.com/ALWADI_2021/iphone/video/video_about.mp4") {
                //initialize video player objet
                let videoPlayer = AVPlayer(url: url)
                let controller = AVPlayerViewController()
                controller.player = videoPlayer
                //Add AVPlayerViewController as a child of current view controller
                self.addChild(controller)
                //video_view is a UIView which you have added in your view controller
                //change the frame of AVPlayer
                controller.view.frame = video_view.bounds
                video_view.addSubview(controller.view)
                controller.didMove(toParent: self)
                //start media player
                videoPlayer.play()
        //            controller.showsPlaybackControls = false
                    controller.videoGravity = .resizeAspectFill
                }
    }
    

}


