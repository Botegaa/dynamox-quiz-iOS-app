//
//  QuizView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//
import UIKit

class QuizScreen: UIView {
    
    let viewModel = QuizViewModel()
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
        label.text = "0/10"
        label.tintColor = .white
        label.font = UIFont(name: "Poppins-Medium", size: 16)
        return label
    }()
    
    func updateQuestionCounter(current: Int, total: Int) {
        questionCounterLabel.text = "\(current)/10"
    }
    
    lazy var questionLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.textAlignment = .center
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
                make.height.equalTo(65)
                
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
            buttonView.button.titleLabel?.textAlignment = .center
            buttonView.button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 12)
            buttonView.button.titleLabel?.numberOfLines = 4

            buttonView.onTap = {
                submitAction(option)
            }

            buttonView.snp.makeConstraints { make in
                make.height.equalTo(65)
            }

            answersStackView.addArrangedSubview(buttonView)
        }
    }
    
    func highlightButtons(selectedAnswer: String, isCorrect: Bool) {
        for case let answerView as AnswerButtonView in answersStackView.arrangedSubviews {
            guard let title = answerView.button.title(for: .normal) else { continue }

            if title == selectedAnswer {
                answerView.backgroundColor = isCorrect ? .systemGreen : .systemRed
            } else {
                answerView.backgroundColor = .clear
            }
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
            make.left.equalTo(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(150)
        }
    }
    
    private func questionCounterLabelSetupConstraints(){
        questionCounterLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.centerX.equalToSuperview()
        }
    }
    
    private func questionLabelSetupConstraints(){
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(questionCounterLabel.snp.bottom).offset(3)
            make.right.equalToSuperview().inset(5)
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(5)
        
        }
    }
    
    private func answerStackSetupConstraints(){
        answersStackView.snp.makeConstraints { make in
            make.top.equalTo(questionView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.right.right.equalToSuperview().inset(30)
            make.bottom.lessThanOrEqualToSuperview().inset(50)
        }
    }
    
    
}


