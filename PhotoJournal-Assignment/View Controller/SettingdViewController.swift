//
//  SettingdViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/4/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class SettingdViewController: UIViewController {
    enum DarkModeSetting: String {
        case on
        case off
    }
    
    @IBOutlet var scrollDirectionlabel: UILabel!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var darkModeSwitch: UISwitch!
    @IBOutlet var sliderButton: UISlider!
     var switchOnOrOff = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func darkModeSwitchPressed(_ sender: UISwitch) {
    }
    
    @IBAction func sliderButtonMoved(_ sender: UISlider) {
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
    }
}
