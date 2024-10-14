//
//  Game.swift
//  Right On Target
//
//  Created by Nikita Shyshkin on 14/10/2024.
//

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    private var lastRound: Int
    private var currentRound: Int = 1
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
    
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
}
