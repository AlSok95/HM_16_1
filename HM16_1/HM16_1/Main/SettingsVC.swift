//
//  SettingsVC.swift
//  HM16_1
//
//  Created by Анна on 13.07.2021.
//

import UIKit
protocol SettingVCDelegate: AnyObject {
    func sendColor(color: UIColor)
}

class SettingsVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redTF: UITextField!
    
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenTF: UITextField!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueTF: UITextField!
    
    
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var alphaTF: UITextField!
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var buttonColor: UIButton!
    
    weak var delegate: SettingVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func redSliderAction(_ sender: UISlider) {
        redTF.text = String(format: "%.f", redSlider.value)
        colorView.backgroundColor = changeColor()
        
    }
    @IBAction func greenSlider(_ sender: UISlider) {
        greenTF.text = String(format: "%.f", greenSlider.value)
        colorView.backgroundColor = changeColor()
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueTF.text = String(format: "%.f", greenSlider.value)
        colorView.backgroundColor = changeColor()
    }
    
    @IBAction func alphaSliderAction(_ sender: UISlider) {
        alphaTF.text = String(format: "%.1f", alphaSlider.value)
        colorView.backgroundColor = changeColor()
    }
    
    
    @IBAction func redTfAction(_ sender: UITextField) {
        if let text = redTF.text,
           let value = Float(text) {
            redSlider.value = value
        }
    }
    
    @IBAction func GreenTfAction(_ sender: UITextField) {
        if let text = greenTF.text,
           let value = Float(text) {
            greenSlider.value = value
        }
    }
    
    
    @IBAction func BlueTfAction(_ sender: UITextField) {
        if let text = blueTF.text,
           let value = Float(text) {
            blueSlider.value = value
        }
    }
    
    
    @IBAction func alphaTfAction(_ sender: UITextField) {
        
        if let text = alphaTF.text,
           let value = Float(text) {
            alphaSlider.value = value
        }
    }
    
    
    @IBAction func butDone(_ sender: UIButton) {
        delegate?.sendColor(color: changeColor())
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    private func changeColor() -> UIColor {
        let redValue = CGFloat(redSlider.value) / 255.0
        let greenValue = CGFloat(greenSlider.value) / 255.0
        let blueValue = CGFloat(blueSlider.value) / 255.0
        let alphaValue = CGFloat(alphaSlider.value)
        
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
    
    
    private func setupUI() {
        mainView.layer.cornerRadius = 10
        colorView.layer.cornerRadius = 10
        buttonColor.layer.cornerRadius = 10
    }

}
