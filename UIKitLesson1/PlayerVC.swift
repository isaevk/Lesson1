//
//  PlayerVC.swift
//  UIKitLesson1
//
//  Created by Kirill Dev on 21.12.2022.
//

import UIKit
import AVFoundation

class PlayerVC: UIViewController {
    
    var player: AVAudioPlayer?
    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet weak var nameAlbumLabel: UILabel!
    
    @IBOutlet weak var nameTrackLabel: UILabel!
    
    @IBOutlet weak var nameArtistLabel: UILabel!
    
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var nextTrackButton: UIButton!
    
    @IBOutlet weak var playPouseButton: UIButton!
    
    @IBOutlet weak var lastTrackButton: UIButton!
    
    
    @IBOutlet weak var timeTrackSlider: UISlider!
    
    @IBOutlet var holder: UIView!
    
    
        private var albumeImage: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
        if holder.subviews.count == 0 {
            configure()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    
    
    private func configure() {
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            
            player.play()
        }
        catch {
            print("error")
        }
        
        albumeImage.frame = CGRect(x: 150,
                                   y: 80,
                                   width: Int(holder.frame.size.width) - 300,
                                   height: Int(holder.frame.size.height) - 400)
        
        albumeImage.image = UIImage(named: song.imageName)
        
        holder.addSubview(albumeImage)
        
        nameAlbumLabel.text! += "\n \(song.albumName)"
        nameTrackLabel.text = song.name
        nameArtistLabel.text = song.artistName
        timeTrackSlider.minimumValue = 0.0
        timeTrackSlider.maximumValue = 1.0
        
 
        
        
    }

    @IBAction func playPouseButton(_ sender: UIButton) {
        if ((player?.isPlaying) != nil) {
            playPouseButton.setImage(UIImage(named: "pause"), for: .normal)
            player?.pause()
        } else {
            playPouseButton.setImage(UIImage(named: "play"), for: .normal)
            player?.play()
        }
        
    }
    
    
    @IBAction func audioSliderUpdate(_ sender: Any) {
        guard let slider = sender as? UISlider, let player = player else {
            return
        }
        player.currentTime = Double(slider.value) * player.duration
    }
    

    
//                trackTime()
    
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
    
    
    
    
    
}

