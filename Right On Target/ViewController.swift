//
//  ViewController.swift
//  Right On Target
//
//  Created by Nikita Shyshkin on 14/10/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    
    @IBAction func checkNumber() {
        let numSlider = Int(self.slider.value.rounded())
        
        if numSlider > self.number {
            self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50
        }
        
        if self.round == 5 {
            let alert = UIAlertController(
                title: "Game Over!",
                message: "You earned \(self.points) points!",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play again", style:
                    .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }
        
        self.number = Int.random(in: 1...50)
        
        self.label.text = String(self.number)
    }
}


