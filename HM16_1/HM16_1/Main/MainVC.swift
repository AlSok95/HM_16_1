//
//  MainVC.swift
//  HM16_1
//
//  Created by Анна on 13.07.2021.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var buttonChangeColor: UIButton!
    var myColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonChange()
        

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     guard let destVC = segue.destination as? SettingsVC,
           let mainVC = navigationController?.viewControllers.first as? MainVC else { return }
     destVC.delegate = mainVC
 }

    
    @IBAction func buttunChangeTap(_ sender: Any) {
        mainView.backgroundColor = myColor
    }
    
    private func buttonChange() {
        buttonChangeColor.layer.cornerRadius = 10
    }
    
}

extension MainVC: SettingVCDelegate {
    func sendColor(color: UIColor) {
        myColor = color
    }
    
}
