//
//  BoardViewController.swift
//  TestProject
//
//  Created by 신동희 on 2022/07/06.
//

import UIKit

class LEDBoardViewController: UIViewController {

    var viewIsHidden: Bool = false
    @IBOutlet weak var textFieldView: UIView!
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textColorButton: UIButton!
    
    @IBOutlet var buttonList: [UIButton]!
    
    @IBOutlet weak var resultLabel: UILabel!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewIsHidden = self.view.isHidden
        
        userTextField.delegate = self
        
        designButton(sendButton, buttonTitle: "전송", highlightedTitle: "빨리보내!", bgColor: .yellow)
        designButton(textColorButton, buttonTitle: "변경", highlightedTitle: "변경한다!", bgColor: .green)
        
        designTextField()
    }
    
    
    func designTextField() {
        userTextField.placeholder = "내용을 작성해주세요."
        userTextField.text = "안녕하세요"
        userTextField.keyboardType = .emailAddress
    }
    
    func designButton(_ button: UIButton, buttonTitle: String, highlightedTitle: String, bgColor: UIColor) {
        button.setTitle(buttonTitle, for: .normal)
        button.setTitle(highlightedTitle, for: .highlighted)
        button.backgroundColor = bgColor
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 3
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
    }
    
    
    func studyOutletCollection() {
        // 반복문
        let buttonArray: [UIButton] = [sendButton, textColorButton]
        
        for item in buttonArray {
            item.backgroundColor = .blue
            item.layer.cornerRadius = 2
        }
        
        
        // 아웃렛 컬렉션
        for item in buttonList {
            item.backgroundColor = .lightGray
            item.layer.cornerRadius = 2
        }
    }
    
    
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        sendTextToLabel()
    }
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        viewIsHidden.toggle()
        textFieldView.isHidden = viewIsHidden
    }
    
    
    // 방법 1
    @IBAction func UserTextFieldDidEndOnExit(_ sender: UITextField) {
        //sendTextToLabel()
    }
    
    
    func sendTextToLabel() {
        resultLabel.text = userTextField.text
        view.endEditing(true)
    }
}


extension LEDBoardViewController: UITextFieldDelegate {
    
    // 방법 2
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendTextToLabel()
        return true
    }
}
