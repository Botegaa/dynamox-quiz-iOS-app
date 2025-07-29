//
//  ViewVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//

import UIKit

var quizScreen : QuizScreen?

class QuizVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        quizScreen = QuizScreen()
        view = quizScreen
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
