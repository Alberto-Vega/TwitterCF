//: Playground - noun: a place where people can play

import UIKit

var listOfNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var tempArray = [Int]()


func reverse(var arrayName: [Int]) -> [Int] {

for i in 1...arrayName.count {
    print(" i is : \(i)")
    print("The index is: \(arrayName.count - i)")
    tempArray.append(arrayName[arrayName.count - i])
    print("\(tempArray)")
}

    arrayName = tempArray
 
    return arrayName
}

reverse(listOfNumbers)