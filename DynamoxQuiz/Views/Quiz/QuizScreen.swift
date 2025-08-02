//
//  QuizView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//
import UIKit

class QuizScreen: UIView {
    
    
    lazy var logoImage = UIImageView.appLogo()
    
    lazy var questionView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.quizMainColor
        view.layer.cornerRadius = 8
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
        label.numberOfLines = 3
        label.tintColor = .white
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        return label
    }()
    
    func updateQuestion(with question: Question) {
       questionLabel.text = question.statement
   }
    
    
    lazy var answersStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.distribution = .fill
        return stack
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
        addSubview(answersStackView)

        for option in ["A", "B", "C", "D", "E"] {
            let answer = AnswerButtonView()
            answer.button.setTitle("Alternativa \(option)", for: .normal)
            answer.snp.makeConstraints{ make in
                make.height.equalTo(53)
                
            }
            answersStackView.addArrangedSubview(answer)
        }
    }
    

    func updateOptions(
        with options: [String],
        questionId: String,
        submitAction: @escaping (String) -> Void
    ) {
        answersStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for option in options {
            let buttonView = AnswerButtonView()
            buttonView.button.setTitle(option, for: .normal)

            buttonView.onTap = {
                submitAction(option)
            }

            buttonView.snp.makeConstraints { make in
                make.height.equalTo(53)
            }

            answersStackView.addArrangedSubview(buttonView)
        }
    }
    
    func highlightButtons(selectedAnswer: String, correctAnswer: String, isCorrect: Bool) {
        for view in answersStackView.arrangedSubviews {
            guard let buttonView = view as? AnswerButtonView else { continue }
            let title = buttonView.button.title(for: .normal)

            if title == correctAnswer {
                buttonView.button.backgroundColor = .systemGreen
            } else if title == selectedAnswer {
                buttonView.button.backgroundColor = .systemRed
            } 

            buttonView.button.isUserInteractionEnabled = false
        }
    }


    
    private func setupContraints(){
        logoImgSetupConstraints()
        questionViewSetupConstraints()
        questionCounterLabelSetupConstraints()
        questionLabelSetupConstraints()
        answerStackSetupConstraints()
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
            make.height.equalTo(150)
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
    
    private func answerStackSetupConstraints(){
        answersStackView.snp.makeConstraints { make in
            make.top.equalTo(questionView.snp.bottom).offset(70)
            make.left.right.equalToSuperview().inset(51)
            make.right.right.equalToSuperview().inset(51)
            make.bottom.lessThanOrEqualToSuperview().inset(50)
        }
    }
    
    
}


