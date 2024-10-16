//
//  Game.swift
//  Right On Target
//
//  Created by Nikita Shyshkin on 14/10/2024.
//

protocol GameProtocol {
    var round: GameRoundProtocol { get }
    var secretValueGenerator: GeneratorProtocol { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
}

class Game: GameProtocol {
    var round: GameRoundProtocol = GameRound()
    var secretValueGenerator: GeneratorProtocol = RandomGenerator()
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
        round.currentSecretValue = getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        startNewRound()
    }
    
    func startNewRound() {
        round.currentSecretValue = getNewSecretValue()
        currentRound += 1
    }
    
    private func getNewSecretValue() -> Int {
        secretValueGenerator.getRandomValue(range: minSecretValue...maxSecretValue)
    }
}
