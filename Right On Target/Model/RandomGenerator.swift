//
//  RandomGenerator.swift
//  Right On Target
//
//  Created by Nikita Shyshkin on 15/10/2024.
//

protocol GeneratorProtocol {
    func getRandomValue(range: ClosedRange<Int>) -> Int
}

class RandomGenerator: GeneratorProtocol {
    func getRandomValue(range: ClosedRange<Int>) -> Int {
        Int.random(in: range)
    }
}
