//
//  GameOverScreenViewController.swift
//  Sharjeel_FinalApplication
//
//  Created by sj15abm on 19/04/2018.
//  Copyright © 2018 CSStestuser. All rights reserved.
//

import UIKit



class GameOverScreenViewController: UIViewController {
    
    @IBOutlet weak var Score: UILabel!
    
    var passingScore = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Score.text = (passingScore)
        

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
