//
//  ViewController.swift
//  多國語言溝通
//
//  Created by 簡吟真 on 2021/3/28.
//
import UIKit
import AVFoundation

class ViewController: UIViewController{
    

        @IBOutlet weak var speedRateText: UILabel! //速度數字文字Label
        @IBOutlet weak var voiceType: UISlider! //音調滑軌
        @IBOutlet weak var voiceTypeText: UILabel! //音調數字文字Label
        @IBOutlet weak var speedRate: UISlider! //速度滑軌
        @IBOutlet weak var loveTextField: UITextField! //文字輸入框
        @IBOutlet weak var volumeSlider: UISlider!
        @IBOutlet weak var volumeSliderText: UILabel!
        @IBOutlet weak var languageSegmentedControl: UISegmentedControl!
    
    
    //滑動slider時顯示數值
    @IBAction func speedRandomClick(_ sender: Any) {
        speedRateText.text = String(format: "%.1f", speedRate.value)
     }
    //滑動slider時顯示數值
    @IBAction func voiceTypeClick(_ sender: Any){
        voiceTypeText.text = String(format: "%.1f", voiceType.value)
    }
    
    @IBAction func volumeSlidereClick(_ sender: Any){
        volumeSliderText.text = String(format: "%.1f", volumeSlider.value)
    }
    
    //滑動slider
    @IBAction func changeSlider(_ sender: UISlider) {
        speedRateText.text = Int(sender.value).description
    }
    //滑動slider
    @IBAction func changeSlider2(_ sender: UISlider) {
        voiceTypeText.text = Int(sender.value).description
    }
    @IBAction func changeSlider3(_ sender: UISlider) {
        volumeSliderText.text = Int(sender.value).description
    }
    
    
    
    
    @IBAction func buttunPressed(_ sender: Any) {    //播放鍵連接至這裡
        view.endEditing(true)
        
        let speechUtterance = AVSpeechUtterance(string: loveTextField.text!)
             let synthesizer = AVSpeechSynthesizer()
             speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
             speechUtterance.pitchMultiplier = voiceType.value
             speechUtterance.rate = speedRate.value
             synthesizer.speak(speechUtterance)
    }
    
    
    
        //點空白處收鍵盤
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
            
        
        }
    // 隨機按鈕
        @IBAction func speedRateClick(_ sender: Any) {
            speedRate.value = Float.random(in: 0.1...2)
            speedRateText.text = String(format: "%.1f", speedRate.value)
        }
        
       @IBAction func pitchRandomClick(_ sender: Any) {
            voiceType.value = Float.random(in: 0.1...2)
            voiceTypeText.text = String(format: "%.1f", voiceType.value)
        }
   
        @IBAction func speedpitchRandomClick(_ sender: Any) {
            speedRate.value = Float.random(in: 0.1...2)
            voiceType.value = Float.random(in: 0.1...2)
            speedRateText.text = String(format: "%.1f", speedRate.value)
            voiceTypeText.text = String(format: "%.1f", voiceType.value)
        }
        
        
    }

