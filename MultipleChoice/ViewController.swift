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
    // Mark: Intializers
    
    
    // Mark: Methods
    
    
    // Mark: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // begin the process
    @IBAction func Compare(_ sender: Any) {
        // Reset the output label from previous usage
        output.text = ""
        // Creating a variable for the correct Questions
        var correctQuestions = 0
        // Reset the Number of correct Questions from previous usage
        correctQuestions = 0
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
        // create an Int constant for the first input
        let QuestionNumberInt = Int(QuestionNumber)
        // Create an index variable for later use
        var index = studentAnswer.index(studentAnswer.startIndex, offsetBy: 0)
        // create an if statement to compare the entered number of questions with the acctual number of student questions
        if studentAnswer.count == QuestionNumberInt {
            // use an if statement in an if statement to compare the entered number of questions to the acctual Number of correct questions
            if QuestionNumberInt == InputCorrect.count {
                // use a loop to compare every student answer with the correct answer
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
                // project the solution on the output label
                output.text = "The number of correct questions is \(correctQuestions)"
                
            } else {
                // ask the user to correct his input through the output label
                output.text = "Please enter exactly \(QuestionNumber) correct answers"
            }
        } else {
            // ask the user to correct the input through the output label
            output.text = "Please enter exactly \(QuestionNumber) student answers"
        }
        
    }
    
}
