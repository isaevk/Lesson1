//
//  CheckViewController.swift
//  UIKitLesson1
//
//  Created by Kirill Dev on 08.12.2022.
//

import UIKit

final class CheckViewController: UIViewController {
    
    @IBOutlet weak var txtName: UILabel!
    
    @IBOutlet weak var txtNum: UILabel!
    
    @IBOutlet weak var txtTable: UILabel!
    
    @IBOutlet weak var txtBooked: UILabel!
    
    @IBOutlet weak var txtPrepay: UILabel!
    
    @IBOutlet weak var txtVip: UILabel!
    
    var name = ""
    var guests = ""
    var table = ""
    var booked = ""
    var prepay = ""
    var vip = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.text = "Full name: \(name)"
        txtNum.text = "Number of guests: \(guests)"
        txtTable.text = "Number of table: \(table)"
        txtBooked.text = "Booked? - \(booked)"
        txtPrepay.text = "Prepayment? - \(prepay)"
        txtVip.text = "VIP room? - \(vip)"
    }
    
    
    
    
    
}

