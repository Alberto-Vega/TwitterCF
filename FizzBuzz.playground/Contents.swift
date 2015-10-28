//: Playground - noun: a place where people can play

import UIKit

for number in 1...100 {
    if (number % 3 == 0 && number % 5 == 0) {
        print("FizzBuzz")
    } else if (number % 3 == 0) {
        print("Fizz")
    } else if (number % 5 == 0) {
        print("Buzz")
    } else {
        print("")
    }
}

for number in 1...100 {
    let multipleOf3 = number % 3 == 0
    let multipleOf5 = number % 5 == 0
    
    if (multipleOf3 && multipleOf5) {
        print("FizzBuzz")
    } else if (multipleOf3) {
        print("Fizz")
    } else if (multipleOf5) {
        print("Buzz")
    } else {
        print("")
    }
}

