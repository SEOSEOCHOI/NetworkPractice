//
//  PapagoViewController.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/17/24.
//

import UIKit


class PapagoViewController: UIViewController {
    

    let manager = PapagoAPIManager()
    
    var sourceCode: String = PapagoValue.lagnuageDictionry[PapagoValue.code.한국어.rawValue] ?? ""
    var targetCode: String = PapagoValue.lagnuageDictionry[PapagoValue.code.영어.rawValue] ?? ""
    
    var sourceValue: String = ""
    var targetValue: String = ""
    
    @IBOutlet var srcButton: UIButton!
    @IBOutlet var targetButton: UIButton!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var messageTextView: UITextView!
    @IBOutlet var translateButton: UIButton!
    @IBOutlet var translateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTextView()

        print(PapagoValue.lagnuageDictionry)
        

    }
    
    @IBAction func langaugeButtonClicekd(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "langaugeTypeViewController") as! langaugeTypeViewController
        
        present(vc, animated: true)
        vc.seletedData = srcButton.titleLabel?.text ?? ""
        
        let nav = UINavigationController(rootViewController: vc)
         
         nav.modalPresentationStyle = .fullScreen
         present(nav, animated: true)
    }
    
    @IBAction func changeButtonClicked(_ sender: UIButton) {
        for langauge in PapagoValue.lagnuageDictionry {
            if langauge.value == srcButton.titleLabel?.text {
                targetValue = langauge.key
            }
            if langauge.value == targetButton.titleLabel?.text {
                sourceValue = langauge.key
            }
        }
        srcButton.setTitle(PapagoValue.lagnuageDictionry[sourceValue], for: .normal)
        targetButton.setTitle(PapagoValue.lagnuageDictionry[targetValue], for: .normal)
    }
    
    
    
    @objc func translateButtonClicked() {
        
        manager.callRequest(text: messageTextView.text!, source: sourceCode, target: targetCode) { value in
            
            self.translateLabel.text = value.message.result.translatedText
        }
        
    }
}


extension PapagoViewController {
    func configureView() {
        messageTextView.delegate = self
        
        srcButton.setTitle(PapagoValue.lagnuageDictionry[PapagoValue.code.한국어.rawValue], for: .normal)
        targetButton.setTitle(PapagoValue.lagnuageDictionry[PapagoValue.code.영어.rawValue], for: .normal)
        
        
        translateButton.addTarget(self, action: #selector(translateButtonClicked), for: .touchUpInside)
    }
}

extension PapagoViewController: UITextViewDelegate {
    func configureTextView() {
        messageTextView.text = "내용을 입력해 주세요"
        messageTextView.textColor = .lightGray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if messageTextView.text.isEmpty {
            messageTextView.text = "내용을 입력해 주세요"
            messageTextView.textColor = .lightGray
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if messageTextView.textColor == .lightGray {
            messageTextView.text = nil
            messageTextView.textColor = .black
        }
    }
}
