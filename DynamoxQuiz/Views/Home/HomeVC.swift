//
//  HomeVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 24/07/25.
//

import UIKit


var homeScreen = HomeScreen()


class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeScreen
        setupActions()
    }
    
    private func setupActions() {
        homeScreen.startBttn.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }

    @objc private func startButtonTapped() {
        let name = homeScreen.nameTextField.text ?? ""

        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            showAlertEmptyName()
        } else {
            let quizVC = QuizVC()
            navigationController?.pushViewController(quizVC, animated: false)
        }
    }

    private func showAlertEmptyName() {
        let alert = UIAlertController(title: "Nome obrigatório", message: "Por favor, digite seu nome para começar o quiz.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
    
    


 
