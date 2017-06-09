//
//  ViewController.swift
//  BUSimplePopup
//
//  Created by burakustn@gmail.com on 06/09/2017.
//  Copyright (c) 2017 burakustn@gmail.com. All rights reserved.
//

import UIKit
import BUSimplePopup

class ViewController: UIViewController {

    let PopupManager = BUSimplePopupManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        PopupManager.PopupsBackgroundColor = .white
        PopupManager.PopupsTitleTextColor  = .black
        PopupManager.PopupsBodyTextColor   = .darkGray
        PopupManager.PopupBackgroundAlpha  = 1.0
        PopupManager.PopupsTitleFont       = UIFont.init(name: "Futura", size: 20)!

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPop_Click(_ sender: Any) {
         PopupManager.showPopup(Popup: BUSimplePopup.init(_title: "BUSimplePopup", _body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", _image: UIImage.init(named: "logo")))
    }
}

