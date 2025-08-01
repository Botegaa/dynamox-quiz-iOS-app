//
//  AnswerButtonView.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 01/08/25.
//

import UIKit
import SnapKit

var onTap: (() -> Void)?






    final class AnswerButtonView: UIView {

        let button: UIButton = {
            let btn = UIButton()
            btn.setTitle("Alternativa", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 16)
            btn.contentHorizontalAlignment = .center
            btn.backgroundColor = .clear
            return btn
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
            backgroundColor = .white
            layer.cornerRadius = 8
            layer.borderColor = UIColor.quizMainColor.cgColor
            layer.borderWidth = 2
            addSubview(button)

            button.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(8)
            }
        }
        
        @objc private func handleTap() {
            onTap?()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }





