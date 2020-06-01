//
//  ViewController.swift
//  floatingButton
//
//  Created by Yoojin Park on 2020/05/27.
//  Copyright © 2020 Yoojin Park. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    @IBOutlet weak var floatingButton: Floating!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingButton.isExpend = false
    }

    @IBAction func floatingButtonShowAction(_ sender: Any) {
        floatingButton.isExpend = !floatingButton.isExpend
    }
    
    @IBAction func floatingButtonClick(_ sender: Any) {
        print("다음 화면으로 이동")
    }
}

class Floating: UIButton {
    var stackView: UIStackView!
    var iconImageView: UIImageView!
    var label: UILabel!
    var sideView: UIView!
    
    var isExpend: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.3, animations: {
                self.label.isHidden = self.isExpend ? false : true
                self.sideView.isHidden = self.isExpend ? false : true
                self.label.alpha = self.isExpend ? 1 : 0
            }, completion: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buttonInit()
    }
    
    func buttonInit() {
        self.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.3137254902, blue: 0.4509803922, alpha: 1)
        self.layer.cornerRadius = 24
        isUserInteractionEnabled = true
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        stackView.isUserInteractionEnabled = false
        
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints { maker in
            maker.leading.equalTo(self.snp.leading).offset(1)
            maker.trailing.equalTo(self.snp.trailing).offset(-1)
            maker.bottom.equalTo(self.snp.bottom).offset(-1)
            maker.top.equalTo(self.snp.top).offset(1)
        }
        
        iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "floatImage")
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { maker in
            maker.width.equalTo(46)
            maker.height.equalTo(46)
        }
        
        label = UILabel()
        label.text = "클릭하기"
        label.font = UIFont(name: label.font.fontName, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        stackView.addArrangedSubview(label)
        
        sideView = UIView()
        stackView.addArrangedSubview(sideView)
        
        sideView.snp.makeConstraints { maker in
            maker.width.equalTo(8)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.01176470588, green: 0.262745098, blue: 0.3803921569, alpha: 1) : #colorLiteral(red: 0.01176470588, green: 0.3137254902, blue: 0.4509803922, alpha: 1)
            label.textColor = isHighlighted ? #colorLiteral(red: 0.9215686275, green: 0.9333333333, blue: 0.9411764706, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            iconImageView.image = isHighlighted ? UIImage(named: "floatImagePressed") : UIImage(named: "floatImage")
            
        }
    }
}
