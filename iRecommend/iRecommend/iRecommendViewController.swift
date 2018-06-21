//
//  iRecommendViewController.swift
//  iRecommend
//
//  Created by GWC on 6/21/18.
//  Copyright © 2018 GWC. All rights reserved.
//

import UIKit

class iRecommendViewController: UIViewController {

    //label of sugesstion
    @IBOutlet weak var label: UILabel!
    
    
    //new suggestion button
    @IBAction func newSuggestion(_ sender: Any) {
        recommendRandomly()
    }
    func recommendRandomly() {
        let recommendations: [String] = ["Strawberry Acia Starbucks Refresher", "Iced Caramel Macchiato", "Vanilla Iced Coffee", "Tripple Mocha Frappuccino", "Cold Foam Cascara Nitro"]
        let length = recommendations.count
        let randomIndex = Int(arc4random_uniform(UInt32(length)))
        let rec = recommendations[randomIndex]
        label.text = rec
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            recommendRandomly()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
recommendRandomly()
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
