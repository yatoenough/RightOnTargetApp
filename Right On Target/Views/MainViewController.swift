//
//  ViewController.swift
//  Right On Target
//
//  Created by Nikita Shyshkin on 14/10/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.round.currentSecretValue))
    }
    
    @IBAction func checkNumber() {
        game.round.calculateScore(with: Int(slider.value.rounded()))
        
        if game.isGameEnded {
            showEndgameAlert(score: game.round.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        updateLabelWithSecretNumber(newText: String(game.round.currentSecretValue))
    }
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showEndgameAlert(score: Int) {
        let alert = UIAlertController(
            title: "Game Over!",
            message: "You earned \(score) points!",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play again", style:
                .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
