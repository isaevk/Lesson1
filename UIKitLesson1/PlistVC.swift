//
//  ViewController.swift
//  UIKitLesson1
//
//  Created by Kirill Dev on 06.12.2022.
//

import UIKit

class PlistVC: UIViewController {
    
    var songs = [Song]()

    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSong()
    }
    
    func configureSong() {
        songs.append(Song(name: "In the dark",
                          albumName: "Exotica",
                          artistName: "Purple Disco Machine",
                          imageName: "cover1",
                          trackName: "audio1"))
        
        songs.append(Song(name: "Running up that hill",
                          albumName: "running up that hill",
                          artistName: "Burton",
                          imageName: "cover2",
                          trackName: "audio2"))
        
        songs.append(Song(name: "I ain't worried ",
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
    
    func switchPlayerVC(position: Int) {
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerVC else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}
