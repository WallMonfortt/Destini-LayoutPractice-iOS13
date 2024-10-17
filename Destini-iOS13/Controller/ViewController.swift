//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    var timer: Timer!
    @IBOutlet weak var questionTextView: UILabel!
    @IBOutlet weak var choiceOneView: UIButton!
    @IBOutlet weak var choiceTwoView: UIButton!
    
    
    @IBAction func choiceSelected(_ sender: UIButton) {
        let choiceDestination = sender.tag
        print("choice destination: \(choiceDestination)")
        storyBrain.updateDastination(choiceDestination)
        
        sender.backgroundColor = UIColor.darkGray
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
            self.updateTexts()
             }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTexts()

    }
    
    func updateTexts() {
        let storyTexts = storyBrain.getTexts()
        questionTextView.text = storyTexts.title
        choiceOneView.setTitle(storyTexts.choice1, for: .normal)
        choiceOneView.tag = storyTexts.choiceDestination1
        choiceTwoView.setTitle(storyTexts.choice2, for: .normal)
        choiceTwoView.tag = storyTexts.choiceDestination2
        choiceOneView.backgroundColor = .clear
        choiceTwoView.backgroundColor = .clear
    }
    


}

