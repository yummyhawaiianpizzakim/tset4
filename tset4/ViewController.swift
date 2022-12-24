//
//  ViewController.swift
//  tset4
//
//  Created by 김요한 on 2022/12/24.
//

import UIKit


class ViewController: UIViewController {
    
    var counter = 0
    var randomvalue = 0
    var doneGame = false
    @IBOutlet weak var sliderValue : UISlider!
    @IBOutlet weak var countdoinghit : UILabel!
    @IBOutlet weak var changedValue : UILabel!
    @IBOutlet weak var minValueLabel : UILabel!
    @IBOutlet weak var maxValueLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Reset()
    }
    
    @IBAction func SlideValueChanged (_ sender : UISlider){
        print(sender.value)
        let intValue = Int(sender.value)
        changedValue.text = String(intValue)
        
    }
    @IBAction func TouchUpHitButton(_ sender : UIButton){
        print(sliderValue.value)
        let intValue = Int(sliderValue.value)
        sliderValue.value = Float(intValue)
        counter += 1
        countdoinghit.text = "\(counter)/5"
        
        
       if randomvalue == Int(sliderValue.value){
            print("hit")
           AlertShow(message: "hit")
            Reset()
       }else if counter > 5{
           print("lose")
           AlertShow(message: "Lose..")
           Reset()
       }else if intValue > randomvalue {
            sliderValue.maximumValue = sliderValue.value
            maxValueLabel.text = String(intValue)
        }else if intValue < randomvalue{
            sliderValue.minimumValue = sliderValue.value
            minValueLabel.text = String(intValue)
        }
    }
    @IBAction func TouchUpResetButton(_ sendder : UIButton){
        print("Reset value")
        Reset()
    }
    
    func Reset(){
        print("reset")
        randomvalue = Int.random(in: 0...30)
        print(randomvalue)
        counter = 0
        sliderValue.value = 15
        sliderValue.minimumValue = 0
        sliderValue.maximumValue = 30
        minValueLabel.text = "0"
        maxValueLabel.text = "30"
        countdoinghit.text = "0/5"
        changedValue.text = "15"
    }
    func AlertShow(message : String){
        let alert = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK",
                                         style: .default){ (action) in self.Reset()}
        alert.addAction(okAction)
        present(alert,animated: true,completion: nil)
        }
}

