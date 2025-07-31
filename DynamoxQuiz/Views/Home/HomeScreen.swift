//
//  HomeView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//
import UIKit
import SnapKit

class HomeScreen: UIView {
    
    lazy var logoImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Logo")
        return img
    }()
    
    lazy var logoLabel : UILabel = {
        let label = UILabel()
        label.text = "Dynamox \nQuiz"
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        return label
    }()
    
    lazy var nameTextFieldLabel : UILabel = {
        let label = UILabel()
        label.text = "Digite seu nome;"
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-SemiBold", size: 16)
        return label
    }()
    
    lazy var nameTextFiel : UITextField = {
        let tf = UITextField ()
        tf.backgroundColor = .backgroundGray
        tf.layer.borderColor = UIColor.quizMainColor.cgColor
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements (){
        
    }
    
    private func setupContraints(){
        
    }
    
}
