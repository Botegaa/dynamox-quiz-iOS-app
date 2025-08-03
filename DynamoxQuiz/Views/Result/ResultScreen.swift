//
//  ResultView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//

import UIKit

class ResultScreen: UIView {

    lazy var questionsLabel = UILabel()
    lazy var correctLabel = UILabel()
    lazy var wrongLabel = UILabel()
    
    lazy var logoImage = UIImageView.appLogo()
    
    lazy var trophyImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "trophy")
        return img
    }()
    
    lazy var resultView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.quizMainColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var congratsLabel : UILabel = {
        let label = UILabel()
        label.text = "Parabéns, Fulano!"
        label.tintColor = .white
        label.font = UIFont(name: "Poppins-Regular", size: 20)
        return label
    }()
    
    lazy var pointsCounterLabel  : UILabel = {
        let label = UILabel()
        label.text = "Você fez pontos."
        label.tintColor = .white
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        return label
    }()
    
    func updatePointsCounter(correct: Int) {
        pointsCounterLabel.text =  "Você fez +\(correct * 10) pontos."
    }
    
    
    
    private func makeResultColumn(title: String, subtitle: String, titleColor: UIColor) -> UIView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = UIFont(name: "Poppins-Regular", size: 16)
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont(name: "Poppins-SemiBold", size: 11)
        
        let vStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.spacing = 4
        vStack.distribution = .fill
        
        let container = UIView()
        container.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100)
        }
        
        return container
    }
    
    
    lazy var resultsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            makeResultColumn(title: "10", subtitle: "perguntas", titleColor: .white),
            makeResultColumn(title: "8", subtitle: "corretas", titleColor: .green),
            makeResultColumn(title: "2", subtitle: "erradas", titleColor: .red)
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    func configureResults(correct: Int, wrong: Int, total: Int) {
        resultsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        resultsStackView.addArrangedSubview(makeResultColumn(title: "\(total)", subtitle: "perguntas", titleColor: .white))
        resultsStackView.addArrangedSubview(makeResultColumn(title: "\(correct)", subtitle: "corretas", titleColor: .green))
        resultsStackView.addArrangedSubview(makeResultColumn(title: "\(wrong)", subtitle: "erradas", titleColor: .red))
    }
    
    lazy var restartBttnView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.quizMainColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var restartBttn : UIButton = {
        let bttn = UIButton ()
        bttn.setTitle("Jogar de novo", for: .normal)
        bttn.setTitleColor(UIColor.white ,for: .normal)
        bttn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 18)
        return bttn
    }()
    
    lazy var goToHomeBttnView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.quizMainColor.cgColor
        return view
    }()
    
    lazy var goToHomeBttn : UIButton = {
        let bttn = UIButton ()
        bttn.setTitle("Voltar ao início", for: .normal)
        bttn.setTitleColor(UIColor.quizMainColor ,for: .normal)
        bttn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 18)
        return bttn
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
        addSubview(resultView)
        addSubview(trophyImage)
        resultView.addSubview(congratsLabel)
        resultView.addSubview(pointsCounterLabel)
        resultView.addSubview(resultsStackView)
        addSubview(restartBttnView)
        restartBttnView.addSubview(restartBttn)
        addSubview(goToHomeBttnView)
        goToHomeBttnView.addSubview(goToHomeBttn)

    }
    
    private func setupContraints(){
        logoImgSetupConstraints()
        resultViewSetupConstraints()
        restartBttnViewSetupConstraints()
        restartBttnViewSetupConstraints()
        restartBttnSetupConstraints()
        goToHomeBttnViewSetupConstraints()
        goToHomeBttnBttnSetupConstraints()
        trophyImageSetupConstraints()
        congratsLabelSetupConstraints()
        pointsCounterLabelSetupConstraints()
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
    
    private func resultViewSetupConstraints(){
        resultView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(166)
            make.left.equalToSuperview().offset(51)
            make.width.equalTo(300)
            make.height.equalTo(197)
        }
    }
    
    private func trophyImageSetupConstraints(){
        trophyImage.snp.makeConstraints { make in
            make.centerY.equalTo(resultView.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(92)
            make.height.equalTo(92)
        }
    }
    
    private func congratsLabelSetupConstraints(){
        congratsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(60)
        }
    }
    
    private func pointsCounterLabelSetupConstraints(){
        pointsCounterLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(congratsLabel.snp.bottom).offset(7)
        }
    }
    
    private func answerStackSetupConstraints(){
        resultsStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(65)
        }
    }

    private func restartBttnViewSetupConstraints(){
        restartBttnView.snp.makeConstraints { make in
            make.top.equalTo(resultView.snp.bottom).offset(12)
            make.left.equalTo(resultView)
            make.width.equalTo(resultView)
            make.height.equalTo(53)
        }
    }
    
    private func restartBttnSetupConstraints(){
        restartBttn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func goToHomeBttnViewSetupConstraints(){
        goToHomeBttnView.snp.makeConstraints { make in
            make.top.equalTo(restartBttnView.snp.bottom).offset(12)
            make.left.equalTo(restartBttnView)
            make.width.equalTo(restartBttnView)
            make.height.equalTo(53)
        }
    }
    
    private func goToHomeBttnBttnSetupConstraints(){
        goToHomeBttn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}
