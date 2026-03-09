/*:
 # CSCI 321/521 Assignment 1
 ## Part B: Swift Foundations
 
 Welcome to the Swift Foundations playground! Complete each exercise below.
 Your code should compile and run without errors.
 
 **Student Name: Ramya Sri Kadiyala**
 **Z-ID: Z2039166**
 **Partner Name (if applicable):Anusha Reddy Kothapeta**
 **Partner Z-ID (if applicable):Z2081200**
 
 ---
 */

import Foundation

/*:
 ## Exercise 1: Variables and Constants (8 points)
 
 ### 1a) App Name and User Count
 Declare a constant for your app's name and a variable for the current user count.
 Print both values.
 */

// Your code for 1a here:
let appName = "Weekly Plate"
var userCount = 10
print("App Name:",appName)
print("User Count:", userCount)



/*:
 ### 1b) Type Inference
 Create variables of type `Int`, `Double`, `String`, and `Bool` with explicit types.
 Then demonstrate type inference by declaring equivalent variables without explicit types.
 */

// Your code for 1b here:
// With explicit types:
let numberOfIngredients: Int = 12
let appRating: Double = 4.8
let cuisineName: String = "Indian"
let isLoggedIn: Bool = true

// With type inference:
let inferredNumberOfIngredients = 12
let inferredAppRating = 4.8
let inferredCuisineName = "Indian"
let inferredIsLoggedIn = true

print(numberOfIngredients, appRating, cuisineName, isLoggedIn)
print(inferredNumberOfIngredients, inferredAppRating, inferredCuisineName, inferredIsLoggedIn)

/*:
 ### 1c) String Interpolation
 Use string interpolation to create a sentence using at least 3 of your variables.
 */

// Your code for 1c here:

let summaryMessage = "Today I’m exploring \(cuisineName) recipes with about \(numberOfIngredients) ingredients. Rating: \(appRating)/5. Logged in: \(isLoggedIn ? "Yes" : "No")."
print(summaryMessage)


/*:
 ---
 ## Exercise 2: Optionals (12 points)
 
 ### 2d) If-Let Unwrapping
 Declare an optional `String` called `userNickname`. Safely unwrap it using `if-let`
 and print either the nickname or "No nickname set".
 */

// Your code for 2d here:
var userNickname: String? = "RK"

if let nickname = userNickname{
    print("Nickname: \(nickname)")
}
else{
    print("No nickname set")
}



/*:
 ### 2e) Guard-Let Function
 Use `guard-let` to create a function `validateEmail(_ email: String?) -> Bool`
 that returns `false` if the email is nil or empty.
 */

// Your code for 2e here:
// guard-let for early exit
func validateEmail(_ email:String?)->Bool{
    guard let safeEmail=email else{
        return false
    }
    if safeEmail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
        return false
    }
    return true
}
print(validateEmail("ram@ram"))
print(validateEmail(nil))
print(validateEmail(""))
print(validateEmail("   "))
print(validateEmail("test@mail.com"))


/*:
 ### 2f) Nil Coalescing
 Demonstrate the nil coalescing operator (`??`) by providing a default value
 for an optional integer representing a user's age.
 */

// Your code for 2f here:
var userAge: Int? = nil

// If userAge is nil, use 18 as the default
let ageToShow = userAge ?? 18
print("Age to show:\(ageToShow)")

// real value instead of default
userAge = 27
let ageToShow2 = userAge ?? 18
print("Age to show: \(ageToShow2)")



/*:
 ### 2g) When to Use Each Approach
 Explain in a comment when you would use `if-let` vs `guard-let` vs nil coalescing.
 */

/*
 Your explanation for 2g here:
 
 if-let: Use this when you want to do if value exists do this, else do that
 
 
 guard-let: Use this inside a function when you need the value to continue.
 
 
 nil coalescing (??): Use this when you just want a default value if it’s nil
 
 */


/*:
 ---
 ## Exercise 3: Collections (10 points)
 
 ### 3h) Arrays
 Create an array of at least 5 items related to your app concept
 (e.g., recipe names, city names, task titles).
 */

// Your code for 3h here:
var weeklyMealIdeas: [String] = [
    "Oats",
    "Salad",
    "Rice",
    "Pasta",
    "Soup"
]

print(weeklyMealIdeas)

/*:
 ### 3i) Dictionaries
 Create a dictionary that maps `String` keys to values appropriate for your app
 (e.g., `["category": "Desserts"]`).
 */

// Your code for 3i here:
var mealPlanSettings: [String: String] = [
    "mealType": "Dinner",
    "difficulty": "Easy",
    "prepTime": "20 min",
    "calories": "450",
    "cuisine": "Indian"
]

print(mealPlanSettings)


/*:
 ### 3j) Modifying Collections
 Demonstrate adding, removing, and accessing elements from both your array and dictionary.
 */

// Your code for 3j here:
// Make mutable copies if needed, then demonstrate:

// Adding to array:
weeklyMealIdeas.append("Pizza")
print("After adding to array: \(weeklyMealIdeas)")

// Removing from array:
let removedMeal = weeklyMealIdeas.remove(at: 1)
print("Removed from array: \(removedMeal)")
print("After removing from array: \(weeklyMealIdeas)")


// Accessing array element:
let firstMeal = weeklyMealIdeas[0]
print("First meal in array: \(firstMeal)")

// Adding to dictionary:
mealPlanSettings["protein"] = "30g"
print("After adding to dictionary: \(mealPlanSettings)")

// Removing from dictionary:
mealPlanSettings.removeValue(forKey: "calories")
print("After removing from dictionary: \(mealPlanSettings)")


// Accessing dictionary value:
let prepTimeValue = mealPlanSettings["prepTime"] ?? "Not set"
print("Prep time from dictionary: \(prepTimeValue)")

/*:
 ### 3k) Sets
 Create a `Set` and demonstrate how it differs from an `Array` by adding duplicate values.
 */

// Your code for 3k here:

// Set removes duplicates automatically
var grocerySet: Set<String> = ["Eggs", "Milk", "Eggs", "Oats", "Milk"]
print("Set (unique only): \(grocerySet)")

// Try adding a duplicate again
grocerySet.insert("Eggs")   // no change, because it's already in the Set
print("Set after inserting duplicate 'Eggs': \(grocerySet)")

// Array allows duplicates
var groceryArray: [String] = ["Eggs", "Milk", "Eggs", "Oats", "Milk"]
print("Array (duplicates allowed): \(groceryArray)")

/*:
 ---
 ## Exercise 4: Control Flow (10 points)
 
 ### 4l) For-In Loop with Index
 Write a `for-in` loop that iterates over your array from Exercise 3
 and prints each item with its index.
 */

// Your code for 4l here:

//enumerated() gives (index, value) pairs for an array
for (index, meal) in weeklyMealIdeas.enumerated() {
    print("Item \(index): \(meal)")
}

/*:
 ### 4m) Switch Statement
 Write a `switch` statement that takes a `String` representing a user action
 (e.g., "view", "edit", "delete") and prints an appropriate message for each case.
 Include a default case.
 */

// Your code for 4m here:
let userAction: String = "view"

switch userAction {
case "view":
    print("Showing the meal details screen.")
case "edit":
    print("Opening the weekly plan editor.")
case "delete":
    print("Removing the meal from the plan.")
default:
    print("Unknown action. Please try again.")
}

/*:
 ### 4n) While Loop
 Write a `while` loop that simulates loading data, counting from 1 to 5
 and printing "Loading... X%" where X increases by 20 each iteration.
 */

// Your code for 4n here:
var step = 1
var percent = 20

while step <= 5 {
    print("Loading... \(percent)%")
    percent += 20
    step += 1
}

/*:
 ---
 ## Exercise 5: Functions and Closures (10 points)
 
 ### 5o) Function with Default Parameter
 Write a function `greetUser(name: String, timeOfDay: String = "day")`
 that returns a personalized greeting string.
 */

// Your code for 5o here:
func greetUser(name: String, timeOfDay: String = "day") -> String {
    return "Good \(timeOfDay), \(name)! Welcome to Weekly Plate."
}

// Test your function:
print(greetUser(name: "RK"))
print(greetUser(name: "RK", timeOfDay: "morning"))


/*:
 ### 5p) Calculate Discount Function
 Write a function `calculateDiscount(price: Double, percentage: Int) -> Double`
 that returns the discounted price.
 */

// Your code for 5p here:
func calculateDiscount(price: Double, percentage: Int) -> Double {
    let discountAmount = price * (Double(percentage) / 100.0)
    let finalPrice = price - discountAmount
    return finalPrice
}


// Test your function:
let discountedPrice = calculateDiscount(price: 200.0, percentage: 15)
print("Discounted price: \(discountedPrice)")

/*:
 ### 5q) Map with Closure
 Use the `map` function with a closure to transform your array from Exercise 3
 (e.g., convert all strings to uppercase).
 */

// Your code for 5q here:
// map transforms every element and returns a new array

let upperMeals = weeklyMealIdeas.map { meal in
    meal.uppercased()
}
print(upperMeals)

/*:
 ### 5r) Filter with Closure
 Use the `filter` function with a closure to filter your array
 based on some condition (e.g., items containing a specific letter).
 */

// Your code for 5r here:
// Keep only meals that contain letter "a"
let mealsWithA = weeklyMealIdeas.filter { meal in
    meal.lowercased().contains("a")
}
print(mealsWithA)


/*:
 ---
 ## 🎉 Congratulations!
 
 You've completed the Swift Foundations exercises. Make sure to:
 1. Review your code for any errors
 2. Add comments where helpful
 3. Ensure everything compiles and runs
 4. Zip this playground for submission
 */
