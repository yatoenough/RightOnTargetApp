//
//  GameRound.swift
//  Right On Target
//
//  Created by Nikita Shyshkin on 15/10/2024.
//

protocol GameRoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get set }
    
    func calculateScore(with value: Int)
}

class GameRound: GameRoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
