//
//  HomeView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//
import UIKit
import SnapKit

class HomeScreen: UIView {
    
    let logoImage = UIImageView.appLogo()

    lazy var logoLabel : UILabel = {
        let label = UILabel()
        label.text = "Dynamox Quiz"
        label.textColor = .quizMainColor
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Poppins-Bold", size: 24)
        return label
    }()
    
    lazy var nameTextFieldLabel : UILabel = {
        let label = UILabel()
        label.text = "Digite seu nome:"
        label.textColor = .quizMainColor
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return label
    }()
    
    lazy var nameTextField : UITextField = {
        let tf = UITextField ()
        tf.backgroundColor = .backgroundGray
        tf.layer.borderColor = UIColor.quizMainColor.cgColor
        tf.layer.borderWidth = 2
        tf.layer.cornerRadius = 12
        return tf
    }()
    
    lazy var startBttnView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.quizMainColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var startBttn : UIButton = {
        let bttn = UIButton ()
        bttn.setTitle("Iniciar", for: .normal)
        bttn.setTitleColor(UIColor.white ,for: .normal)
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
    
    private func addElements (){
        addSubview(logoImage)
        addSubview(logoLabel)
        addSubview(nameTextFieldLabel)
        addSubview(nameTextField)
        addSubview(startBttnView)
        startBttnView.addSubview(startBttn)

    }
    
    private func setupContraints(){
        logoImgSetupConstraints()
        logoLabelSetupConstraints()
        nameTextFieldLabelSetupConstraints()
        nameTextFieldSetupConstraints()
        startBttnViewSetupConstraints()
        startBttnSetupConstraints()
    }
    
    private func logoImgSetupConstraints(){
           logoImage.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(55)
               make.left.equalToSuperview().offset(77)
               make.width.equalTo(56)
               make.height.equalTo(56)
           }
       }
    
    private func logoLabelSetupConstraints(){
           logoLabel.snp.makeConstraints { make in
               make.top.equalTo(logoImage).offset(12)
               make.left.equalTo(logoImage.snp.right).offset(12)
           }
       }
    
    private func nameTextFieldLabelSetupConstraints(){
           nameTextFieldLabel.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(368)
               make.left.equalTo(nameTextField)
           }
       }
    
    private func nameTextFieldSetupConstraints(){
           nameTextField.snp.makeConstraints { make in
               make.top.equalTo(nameTextFieldLabel.snp.bottom).offset(12)
               make.left.equalToSuperview().offset(53)
               make.width.equalTo(299)
               make.height.equalTo(53)
           }
       }
    
    private func startBttnViewSetupConstraints(){
        startBttnView.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(12)
            make.left.equalTo(nameTextField)
            make.width.equalTo(299)
            make.height.equalTo(53)
        }
    }
    
    private func startBttnSetupConstraints(){
        startBttn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}
