//
//  HomeVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 24/07/25.
//

import UIKit




class HomeVC: UIViewController {
    
    var homeScreen = HomeScreen()


    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeScreen
        setupActions()
        navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        let userName = homeScreen.nameTextField.text ?? ""
        setupDismissKeyboardGesture()
    }
    
    private func setupActions() {
        homeScreen.startBttn.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }

    @objc private func startButtonTapped() {
        let name = homeScreen.nameTextField.text ?? ""

        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            showAlertEmptyName()
        } else {
            let userName = homeScreen.nameTextField.text ?? ""
            let quizVC = QuizVC(userName: userName)
            navigationController?.pushViewController(quizVC, animated: false)
        }
    }

    private func showAlertEmptyName() {
        let alert = UIAlertController(title: "Nome obrigatório", message: "Por favor, digite seu nome para começar o quiz.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        
        
    }
    
    private func setupDismissKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}


    


 
