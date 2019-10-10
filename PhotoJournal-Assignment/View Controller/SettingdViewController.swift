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
    enum ScrollDirection:String {
        case on
        case off
    }
    
    @IBOutlet var directionLabel: UILabel!
    @IBOutlet var changeModeLabelHeader: UILabel!
    @IBOutlet var darkModelabel: UILabel!
    @IBOutlet var darkModeSwitch: UISwitch!
    @IBOutlet var scrollDirectionLabel: UILabel!
    @IBOutlet var directionSwitch: UISwitch!
    
    var switchOnOrOff = false
    var horizonlScrollDirection = false
   
    weak var delegate: SettingsDelegate?
    weak var directionDelegate: ScrollDirectionDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch switchOnOrOff {
        case true :
            self.darkModeSwitch.isOn = true
            setDarkMode()
        case false:
            self.darkModeSwitch.isOn = false
            setBrightMode()
    }
        
        switch horizonlScrollDirection{
        case true:
            self.directionSwitch.isOn = true
        case false:
            self.directionSwitch.isOn = false
            
        }
    }
    
    private func setDarkMode(){
        self.view.backgroundColor = .black
        darkModelabel.text = "Dark Mode"
        darkModelabel.textColor = .yellow
        changeModeLabelHeader.textColor = .yellow
        scrollDirectionLabel.textColor = .yellow
        directionLabel.textColor = .yellow
    }
    
    private func setBrightMode(){
        self.view.backgroundColor = .white
        darkModelabel.text = "Bright Mode"
        darkModelabel.textColor = .black
        changeModeLabelHeader.textColor = .black
        scrollDirectionLabel.textColor = .black
        directionLabel.textColor = .black
    }
    private func setDarkMode(setting: DarkModeSetting) {
        switch setting {
        case .on :
            delegate?.darkModeOn()
        case .off:
            delegate?.darkModeOff()
        }
    }
    
    private func setScrollDirection(setting:ScrollDirection){
        switch setting{
        case .on:
            directionDelegate?.setHorizontalDirection()
        case .off:
            directionDelegate?.setVerticalDirection()
        }
    }
    @IBAction func darkModeSwitchPressed(_ sender: UISwitch) {
        switch sender.isOn {
            
        case true:
            setDarkMode(setting: .on)
            setDarkMode()
            
        case false:
            setDarkMode(setting: .off)
            setBrightMode()
            
        }
    }
    
    @IBAction func horizontalSwitchPressed(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            setScrollDirection(setting: .on)
            directionLabel.text = "Horizontal"
        case false:
            setScrollDirection(setting: .off)
            directionLabel.text = "Vertical"
        }
    }
    

}
