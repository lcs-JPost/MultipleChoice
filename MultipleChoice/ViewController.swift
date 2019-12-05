//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Justus Post on 2019-12-03.
//  Copyright © 2019 Justus Post. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
// Mark: Properties
    @IBOutlet weak var NumberOfQuestions: UITextField!
    @IBOutlet weak var StudentInput: UITextField!
    @IBOutlet weak var correctInput: UITextField!
    @IBOutlet weak var output: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // begin the process
    @IBAction func Compare(_ sender: Any) {
        // protect the first input
        guard let QuestionNumber = NumberOfQuestions.text, QuestionNumber.count > 0 else {
            output.text = "Please enter an Integer greater than 0"
            return
        }
        // protect the second input
        guard let studentAnswer = StudentInput.text, studentAnswer.count > 0 else {
            output.text = "Please make sure all the student answers are given"
            return
        }
        // protect the third input
        guard let InputCorrect = correctInput.text, InputCorrect.count > 0 else {
              output.text = "Please make sure all the correct answers are given"
            return
        }
        var index = studentAnswer.index(studentAnswer.startIndex, offsetBy: 0)
        var correctQuestions = 0
        // compare the students with the correct answer
        for (position, character) in InputCorrect.enumerated() {
            print(position)
            print(character)
            index = studentAnswer.index(studentAnswer.startIndex, offsetBy: position)
            if character == studentAnswer[index] {
                correctQuestions += 1
            } else {
                break
            }
        }
        output.text = "The number of correct questions is \(correctQuestions)"
    }
    
}

