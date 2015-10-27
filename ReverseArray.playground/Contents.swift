//: Playground - noun: a place where people can play

import UIKit

var listOfNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var tempArray = [Int]()

for i in 1...listOfNumbers.count {
    print(" i is : \(i)")
    print("The index is: \(listOfNumbers.count - i)")
    tempArray.append(listOfNumbers[listOfNumbers.count - i])
    print("\(tempArray)")
}

listOfNumbers = tempArray
