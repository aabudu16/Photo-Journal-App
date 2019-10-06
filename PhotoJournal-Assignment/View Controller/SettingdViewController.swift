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
    
    
    @IBOutlet var darkModelabel: UILabel!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var darkModeSwitch: UISwitch!
    @IBOutlet var sliderButton: UISlider!
     var switchOnOrOff = false
   
    weak var delegate: SettingsDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch switchOnOrOff {
        case true :
            self.darkModeSwitch.isOn = true
            darkModelabel.text = "Dark Mode"
        case false:
            self.darkModeSwitch.isOn = false
            darkModelabel.text = "Bright Mode"
        }
    }
    
    private func setDarkMode(setting: DarkModeSetting) {
        switch setting {
        case .on :
            delegate?.darkModeOn()
        case .off:
            delegate?.darkModeOff()
        }
    }
    @IBAction func darkModeSwitchPressed(_ sender: UISwitch) {
        switch sender.isOn {
            
        case true:
            setDarkMode(setting: .on)
            darkModelabel.text = "Dark Mode"
        case false:
            setDarkMode(setting: .off)
            darkModelabel.text = "Bright Mode"
        }
    }
    
    @IBAction func sliderButtonMoved(_ sender: UISlider) {
    }
    
    
    @IBAction func scrollDirectionButtonPressed(_ sender: UISwitch) {
       
    }
    
}
