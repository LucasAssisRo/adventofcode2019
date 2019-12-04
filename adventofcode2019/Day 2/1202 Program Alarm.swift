//
//  File.swift
//  adventofcode2019
//
//  Created by Lucas Assis Rodrigues on 04.12.19.
//  Copyright © 2019 Lucas Assis Rodrigues. All rights reserved.
//

enum DayTwo {

    static func partOne() -> Int {
        computeProgram(noun: 12, verb: 2)
    }

    static func partTwo() -> Int {
        let range = 0...99
        for noun in range {
            for verb in range where computeProgram(noun: noun, verb: verb) == 19690720 {
                return 100 * noun + verb
            }
        }

        fatalError()
    }

    private static func computeProgram(noun: Int, verb: Int) -> Int {
        var intcode = self.intcode
        intcode[1] = noun
        intcode[2] = verb
        for i in stride(from: 0, through: intcode.count, by: 4) {
            switch intcode[i] {
            case 1:
                intcode[intcode[i + 3]] = intcode[intcode[i + 1]] + intcode[intcode[i + 2]]

            case 2:
                intcode[intcode[i + 3]] = intcode[intcode[i + 1]] * intcode[intcode[i + 2]]

            case 99:
                return intcode[0]

            default:
                fatalError()
            }
        }

        return intcode[0]
    }

    // MARK: - Input
   private static let intcode = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,19,9,23,1,23,6,27,2,27,13,31,1,10,31,35,1,10,35,39,2,39,6,43,1,43,5,47,2,10,47,51,1,5,51,55,1,55,13,59,1,59,9,63,2,9,63,67,1,6,67,71,1,71,13,75,1,75,10,79,1,5,79,83,1,10,83,87,1,5,87,91,1,91,9,95,2,13,95,99,1,5,99,103,2,103,9,107,1,5,107,111,2,111,9,115,1,115,6,119,2,13,119,123,1,123,5,127,1,127,9,131,1,131,10,135,1,13,135,139,2,9,139,143,1,5,143,147,1,13,147,151,1,151,2,155,1,10,155,0,99,2,14,0,0]
}
