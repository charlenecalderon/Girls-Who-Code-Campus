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
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    @IBAction func submitAnswer0(_ sender: Any) {
        
        //write code here
        checkAnswer(idx: 0)
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        
        //write code here
        checkAnswer(idx: 1)
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    var currentQuestion: Question!
    var currentQuestionPosition: Int = 0
    var noCorrect: Int = 0
    
    var questions: [Question] = [
        Question(question: "What is Ariel's father's name?", answers: ["King Atlantis", "Poseiden","King Triton", "King Thriton"], correctAnswer: 3),
        Question(question: "What does Ariel collect?", answers: ["human items", "shells", "eels", "seaweed"], correctAnswer: 0),
        Question(question: "Where does Ariel want to be?", answers: ["Atlantis","where the people are", "on a boat", "with whales"], correctAnswer: 1),
        Question(question: "Who does Ariel rescue during a storm?", answers: ["Sebastian", "Ursula", "her father","Prince Eric"], correctAnswer: 3),
        Question(question: "What does her father forbid her to do?", answers: ["sing", "swim to the surface", "be friends with Sebastian", "play with dolphins"], correctAnswer: 1)
    ]
    
    
    
    func checkAnswer(idx: Int) {
        if(idx == currentQuestion!.correctAnswer) {
            noCorrect += 1
        }
        loadNextQuestion()
    }
    func setQuestions() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text="Question: \(currentQuestionPosition + 1)/\(questions.count)"
    }
    
    func loadNextQuestion() {
        //NEED AN IF STATEMENT TO MAKE THE CODE WORK
        if (currentQuestionPosition + 1 == questions.count) {
            // GO THE THE NEXT SCREEN
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
        else{
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestions()
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestion = questions[0]
        setQuestions()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            let vc = segue.destination as! ResultsViewController
            vc.noCorrect = noCorrect
            vc.total = questions.count
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

