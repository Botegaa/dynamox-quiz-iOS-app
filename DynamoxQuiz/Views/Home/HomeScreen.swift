//
//  HomeView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//
import UIKit


class HomeScreen: UIView {
    
    lazy var logoImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Logo")
        return img
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
