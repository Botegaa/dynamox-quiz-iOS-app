//
//  QuizView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//
import UIKit

class QuizScreen: UIView {
    
    let logoImage = UIImageView.appLogo()
    
    lazy var questionView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.quizMainColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var questionCounterLabel : UILabel = {
        let label = UILabel()
        label.text = "7/10"
        label.tintColor = .white
        label.font = UIFont(name: "Poppins-Medium", size: 16)
        return label
    }()
    
    lazy var questionLabel : UILabel = {
        let label = UILabel()
        label.text = "teste"
        label.tintColor = .white
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElements()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(logoImage)
        addSubview(questionView)
        questionView.addSubview(questionCounterLabel)
        questionView.addSubview(questionLabel)
    }
    
    private func setupContraints(){
        logoImgSetupConstraints()
        questionViewSetupConstraints()
        questionCounterLabelSetupConstraints()
        questionLabelSetupConstraints()
    }
    
    private func logoImgSetupConstraints(){
           logoImage.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(55)
               make.centerX.equalTo(snp.centerX)
               make.width.equalTo(56)
               make.height.equalTo(56)
           }
       }
    
    private func questionViewSetupConstraints(){
        questionView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(32)
            make.left.equalTo(41)
            make.right.equalToSuperview().inset(41)
            make.height.equalTo(170)
        }
    }
    
    private func questionCounterLabelSetupConstraints(){
        questionCounterLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func questionLabelSetupConstraints(){
        questionLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    
}
