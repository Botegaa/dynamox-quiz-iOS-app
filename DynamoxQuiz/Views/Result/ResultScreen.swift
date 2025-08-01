//
//  ResultView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//

import UIKit

class ResultScreen: UIView {

    lazy var logoImage = UIImageView.appLogo()
    
    lazy var trophyImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "trophy")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var resultView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.quizMainColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var restartBttnView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.quizMainColor
        view.layer.cornerRadius = 12
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
        view.layer.cornerRadius = 12
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
        addSubview(trophyImage)
        addSubview(resultView)
        addSubview(restartBttnView)
        restartBttn.addSubview(restartBttn)
        addSubview(goToHomeBttnView)
        goToHomeBttnView.addSubview(goToHomeBttn)

    }
    
    private func setupContraints(){
        logoImgSetupConstraints()
        restartBttnViewSetupConstraints()
        restartBttnViewSetupConstraints()
        restartBttnSetupConstraints()
        goToHomeBttnViewSetupConstraints()
        goToHomeBttnBttnSetupConstraints()
    }
    
    private func logoImgSetupConstraints(){
           logoImage.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(55)
               make.centerX.equalTo(snp.centerX)
               make.width.equalTo(56)
               make.height.equalTo(56)
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
