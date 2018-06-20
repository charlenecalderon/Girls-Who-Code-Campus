//
//  ResultsViewController.swift
//  quizApp
//
//  Created by GWC on 6/19/18.
//  Copyright © 2018 GWC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var progress: UILabel!
    
    var noCorrect: Int = 0
    var total: Int = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.text = "YOU GOT \(noCorrect)/\(total) CORRECT !"
        // WRITE IF CONDITIONALS TO FIND OUT RESULT
        let percent = double_t(noCorrect/total) * 100
        var resultText: String
        
        if (percent <= 25) {
            resultText = ("YOU DID SO BAD...SMH")
        }else if(percent <= 50){
            resultText = "YOU ARE NOT A TRUE FAN :("
        }else if(percent <= 75){
            resultText = "NOT AS WELL AS I EXPECTED..."
        }else{
            resultText = "GREAT JOB !!!!!"
        }
        resultLabel.text = resultText
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
