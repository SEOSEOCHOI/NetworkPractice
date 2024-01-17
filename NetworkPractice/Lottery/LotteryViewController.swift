//
//  LotteryViewController.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/16/24.
//

import UIKit

class LotteryViewController: UIViewController {
    
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var numberImageView: [UIImageView]!
    @IBOutlet var bonusNumber: UILabel!
    
    let lotteyPicker = UIPickerView()
    let lotteryManager = LottoAPIManager()
    let list: [Lottery] = []
    let numberList: [Int] = Array(1...1102).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureLotteryPicker()
    }
}

// MARK: View
extension LotteryViewController {
    
    func configureView() {
        
        tabBarItem.title = "Lottery"
        bonusNumber.text = "보너스 번호"
        TitleLabel.text = "로또 당첨 번호"
        
        
        lotteryManager.callRequest(number: "1102") { value in
            self.numberTextField.text = "\(value.drwNo) 회차"
            
            self.numberTextField.tintColor = .clear
            self.numberTextField.inputView = self.lotteyPicker
            
            for count in 0 ... self.numberImageView.count - 1 {
                
                var imageCount = 0
                
                var valueNumber: Int
                switch count {
                case 0:
                    valueNumber = value.drwtNo1
                case 1:
                    valueNumber = value.drwtNo2
                case 2:
                    valueNumber = value.drwtNo3
                case 3:
                    valueNumber = value.drwtNo4
                case 4:
                    valueNumber = value.drwtNo5
                case 5:
                    valueNumber = value.drwtNo6
                case 6:
                    valueNumber = value.bnusNo
                default:
                    valueNumber = 0
                }
                
                
                let image = String(valueNumber) + ".circle.fill"
                self.numberImageView[count].image = UIImage(systemName: image)
                self.numberImageView[count].tintColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
                imageCount = imageCount + 1
  
            }
        }
    }
}

// MARK: Lottry Pickter
extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func configureLotteryPicker() {
        lotteyPicker.delegate = self
        lotteyPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //numberTextField.text = "\(numberList[row]) 회차"
        lotteryManager.callRequest(number: String(numberList[row])) { value in
            
            self.numberTextField.text = "\(value.drwNo) 회차"
            
            
            for count in 0 ... self.numberImageView.count - 1 {
                
                var imageCount = 0
                
                var valueNumber: Int
                switch count {
                case 0:
                    valueNumber = value.drwtNo1
                case 1:
                    valueNumber = value.drwtNo2
                case 2:
                    valueNumber = value.drwtNo3
                case 3:
                    valueNumber = value.drwtNo4
                case 4:
                    valueNumber = value.drwtNo5
                case 5:
                    valueNumber = value.drwtNo6
                case 6:
                    valueNumber = value.bnusNo
                default:
                    valueNumber = 0
                }
                
                
                let image = String(valueNumber) + ".circle.fill"
                self.numberImageView[count].image = UIImage(systemName: image)
                self.numberImageView[count].tintColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
                imageCount = imageCount + 1
  
            }
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(numberList[row])회차"
    }
}
