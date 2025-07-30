//
//  ResultVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//

import UIKit

var resultScreen : ResultScreen?

class ResultVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resultScreen = ResultScreen()
        view = resultScreen

        // Do any additional setup after loading the view.
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
