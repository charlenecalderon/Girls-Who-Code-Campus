//
//  ViewController.swift
//  quizApp
//
//  Created by GWC on 6/19/18.
//  Copyright © 2018 GWC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBAction func submitAnswer0(_ sender: Any) {
        
        //write code here
        checkAnswer(idx: 0)
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        
        //write code here
        checkAnswer(idx: 1)
    }
    
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0
    
    var questions: [Question] = [
        Question(question: "What is Ariel's father's name?", answers: ["King Atlantis", "King Triton"], correctAnswer: 1),
        Question(question: "What does Ariel collect?", answers: ["human items", "shells"], correctAnswer: 0),
        Question(question: "Where does Ariel want to be?", answers: ["where the people are", "on a boat"], correctAnswer: 0),
        Question(question: "Who does Ariel rescue during a storm?", answers: ["Sebastian", "Prince Eric"], correctAnswer: 1),
        Question(question: "What does her father forbid her to do?", answers: ["sing", "swim to the surface"], correctAnswer: 1)
    ]
    
    var currentQuestion: Question?
    
    func checkAnswer(idx: Int) {
        if(idx == currentQuestion?.correctAnswer) {
            noCorrect += 1
        }
        loadNextQuestion()
    }
    func loadNextQuestion() {
        //NEED AN IF STATEMENT TO MAKE THE CODE WORK
        performSegue(withIdentifier: "sgShowResults", sender: nil)
        currentQuestionPosition += 1
        currentQuestion = questions[currentQuestionPosition]
    }
    func setQuestions() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        progressLabel.text="Question: \(currentQuestionPosition + 1)/\(questions.count)"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setQuestions()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

