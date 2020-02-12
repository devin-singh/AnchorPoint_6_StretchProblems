/*:
 # Monday Stretch Problem 6.1
 ## Game of Threes
 
 ### Instructions:
 1. Make a method that takes an Int and returns an array of steps to get to 1.
 2. The game goes as follows: Start with the given Int and, if it is divisible by 3, divide it by 3, otherwise ADD OR SUBTRACT 1 (whichever makes the number divisible by 3, then divide it.
 3. Repeat step 2, until you reach 1.
 
 Example: Input: 100 Output: [100, 33, 11, 4, 1]
 
 ### Black Diamond 💎💎💎
 1. Instead of returning an array, return a dictionary where the keys are the values from the array, and the keys are 0, -1, or 1 depending on how the number was manipulated to make it divisible by 3
 2. Sadly, the key value pairs won't be ordered :( Example: Input: 100 Output: [100 : -1 , 33 : 0, 11 : 1, 4 : -1 , 1 : 0]
*/

import UIKit

func returnSteps(int: Int) -> [Int:Int] {
    var testInt = int
    var stepsDict: [Int:Int] = [:]
    while testInt > 0 {
        if testInt % 3 == 0 {
            stepsDict[testInt] = 0
            testInt = testInt/3
        } else if (testInt + 1) % 3 == 0 {
            stepsDict[testInt] = 1
            testInt = (testInt+1)/3
        }else if (testInt - 1) % 3 == 0 {
            stepsDict[testInt] = -1
            testInt = (testInt-1)/3
        }
    }
    return stepsDict
}
returnSteps(int: 100).compactMap( { ($0.key, $0.value) }).sorted(by: { $0.0 > $1.0 })


//: [Next](@next)

//: [Previous](@previous)
/*:
 # Tuesday Stretch Problem 6.2
 ## Add Ints
 
 ### Instructions:
 Create a func called add where the method allows one to pass as many or as few Ints as desired and then adds them together and returns the result.
 
 Example: If I call add(3, 7), it prints out 10. Example: If I call add(3, 7, 2, 4), it prints out 16. Example: If I call add(3, 7, 2, 9, 12, 11), it prints out 44.
 */

import Foundation

//: [Next](@next)

func sumOf(_ numbers: Int...) -> Int {
    numbers.reduce(0, +)
}

sumOf(1, 2, 3, 4)


//: [Previous](@previous)
/*:
 # Wednesday Stretch Problem 6.3
 ## Fibbonacci Number
 
 ### Instructions:
 1. Create a function that finds the closest fibonacci number that is less than or equal to the number that is passed into a function.
 2. Don't hesitate to Google what a Fibonacci number is.
 3. Test it by passing in the number 2000. We will compare results.
 
 ### Black Diamond 💎💎💎
 Create the above using a single line of code in the function body. (Hint: recursion)
 */


import Foundation

func findClosestFib(num: Int) -> Int {
    
    var previousValue: Int = 0
    var currentValue = 1
    
    while num >= currentValue {
        let currentValuePlaceholder = currentValue  // 2
        currentValue = currentValue + previousValue // 3
        previousValue = currentValuePlaceholder // 2
    }
    
    return previousValue
    //return abs(num-currentValue) < abs(num-previousValue) ? currentValue : previousValue
}

findClosestFib(num: 2000)


func findClosestFibRecur(goal: Int, currentVal: Int = 1, previousVal: Int = 0) -> Int {
    return goal >= currentVal ? findClosestFibRecur(goal: goal, currentVal: currentVal + previousVal, previousVal: currentVal) : previousVal
}

findClosestFibRecur(goal: 3)


//: [Next](@next)


