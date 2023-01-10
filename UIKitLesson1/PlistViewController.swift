//
//  ViewController.swift
//  UIKitLesson1
//
//  Created by Kirill Dev on 06.12.2022.
//

import UIKit

final class PlistViewController: UIViewController {
    
    private var arrayOfSongs = Position()
    
    @IBOutlet private var firstButton: UIButton!
    @IBOutlet private var secondButton: UIButton!
    @IBOutlet private var thirdButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSong()
    }
    
    private func configureSong() {
        arrayOfSongs.songs.append(Song(name: "In the dark",
                          albumName: "Exotica",
                          artistName: "Purple Disco Machine",
                          imageName: "cover1",
                          trackName: "audio1"))
        
        arrayOfSongs.songs.append(Song(name: "Running up that hill",
                          albumName: "Running up that hill",
                          artistName: "Burton",
                          imageName: "cover2",
                          trackName: "audio2"))
        
        arrayOfSongs.songs.append(Song(name: "I ain't worried ",
                          albumName: "Top Gun: Maverick",
                          artistName: "OneRepublic",
                          imageName: "cover3",
                          trackName: "audio3"))
    }
    
    @IBAction func songFirstButton(_ sender: Any) {
        switchPlayerVC(position: 0)
    }
    
    @IBAction func songSecondButton(_ sender: Any) {
        switchPlayerVC(position: 1)
    }
    
    @IBAction func songThirdButton(_ sender: Any) {
        switchPlayerVC(position: 2)
    }
    
    private func switchPlayerVC(position: Int) {
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.position.songs = arrayOfSongs.songs
        vc.position.position = position
        present(vc, animated: true)
    }
}

