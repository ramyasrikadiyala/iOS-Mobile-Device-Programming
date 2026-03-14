/*:
 # CSCI 321/521 Assignment 2
 ## Part B: Swift Mastery Exercises
 
 Complete each exercise below. Your code should compile and run without errors.
 
 **Student Name: Ramya Sri Kadiyala**
 **Z-ID: Z2039166**
 **Partner Name : Anusha Reddy Kothapeta**
 **Partner Z-ID : Z2081200**
 
 ---
 */

import Foundation

/*:
 ## Exercise 1: Error Handling (15 points)
 
 ### 1a) ValidationError Enum
 Create an enum `ValidationError` that conforms to `Error` with the following cases:
 - `emptyField(fieldName: String)`
 - `invalidFormat(fieldName: String)`
 - `valueTooLong(fieldName: String, maxLength: Int)`
 */

// Your code for 1a here:
enum ValidationError: Error {
    case emptyField(fieldName: String)
    case invalidFormat(fieldName: String)
    case valueTooLong(fieldName: String, maxLength: Int)
}



/*:
 ### 1b) Validate Username Function
 Write a function `validateUsername(_ username: String?) throws -> String` that:
 - Throws `emptyField` if username is nil or empty
 - Throws `invalidFormat` if username contains non-alphanumeric characters
 - Throws `valueTooLong` if username length > 20
 - Returns the valid username if all checks pass
 
 **Hint:** You can use `CharacterSet.alphanumerics` to check for valid characters.
 */

// Your code for 1b here:
func validateUsername(_ username: String?) throws -> String {
    guard let username = username, !username.isEmpty else {
        throw ValidationError.emptyField(fieldName: "username")
    }
    
    guard username.unicodeScalars.allSatisfy({ CharacterSet.alphanumerics.contains($0) }) else {
        throw ValidationError.invalidFormat(fieldName: "username")
    }
    
    guard username.count <= 20 else {
        throw ValidationError.valueTooLong(fieldName: "username", maxLength: 20)
    }
    
    return username
}

/*:
 ### 1c) Calling the Validation Function
 Demonstrate calling your validation function with:
 1. `do-catch` - handle different error cases
 2. `try?` - convert to optional
 3. `try!` - force try (use a value you KNOW is safe)
 */

// Your code for 1c here:

// Using do-catch:
do {
    let username = try validateUsername("validUser123")
    print("Valid username: \(username)")
} catch ValidationError.emptyField(let fieldName) {
    print("Error: \(fieldName) is empty")
} catch ValidationError.invalidFormat(let fieldName) {
    print("Error: \(fieldName) has invalid format")
} catch ValidationError.valueTooLong(let fieldName, let maxLength) {
    print("Error: \(fieldName) exceeds max length of \(maxLength)")
} catch {
    print("Unexpected error: \(error)")
}

// Using try?:
let optionalUsername: String? = try? validateUsername("hello_world") // nil due to invalid format
let validOptional: String? = try? validateUsername("validUser")
print("Optional result: \(String(describing: optionalUsername))") // nil
print("Optional result: \(String(describing: validOptional))")    // Optional("validUser")


// Using try! (with a safe value):
let forcedUsername = try! validateUsername("safeUsername")
print("Forced username: \(forcedUsername)")


/*:
 ### 1d) When to Use Each Approach
 Write a comment explaining when you would use each approach: `do-catch` vs `try?` vs `try!`
 */

/*
 Your explanation for 1d here:
 
 do-catch:Use this when you need to know exactly what went wrong. If a username is empty
          that's a different problem than it being too long, and you'd want to handle
          those separately. Most real code uses this because errors usually matter.
 
 try?:Use this when failure is fine and you just want nil instead of an error.
      Good for optional lookups or attempts where not finding something is normal
      and you don't need to explain why it failed.
 
 try!:Use this only when you are completely sure it won't fail, like a hardcoded
      value you already know is valid. If it does throw, the app crashes immediately,
      so only use it when failure is genuinely impossible.
 
 */


/*:
 ---
 ## Exercise 2: Protocols (15 points)
 
 ### 2e) Displayable Protocol
 Create a protocol `Displayable` with the following requirements:
 - `var title: String { get }`
 - `var subtitle: String { get }`
 - `func formattedDescription() -> String`
 */

// Your code for 2e here:




/*:
 ### 2f) Conform Your Primary Model
 Copy your primary model from Part A (or create a simplified version) and make it conform to `Displayable`.
 
 **Note:** If you haven't completed Part A yet, create a simple model like `Book` or `Task` with a few properties.
 */

// Your code for 2f here:




/*:
 ### 2g) Second Conforming Type
 Create a second, unrelated struct (e.g., `Event`, `Product`, `Contact`) that also conforms to `Displayable`.
 */

// Your code for 2g here:




/*:
 ### 2h) Print Info Function
 Write a function `printInfo(for item: Displayable)` that prints the formatted description.
 */

// Your code for 2h here:




/*:
 ### 2i) Demonstrate Protocol Usage
 Demonstrate calling `printInfo` with instances of both conforming types.
 */

// Your code for 2i here:




/*:
 ---
 ## Exercise 3: Generics (10 points)
 
 ### 3j) Generic findFirst Function
 Write a generic function:
 ```
 findFirst<T: Equatable>(in array: [T], where predicate: (T) -> Bool) -> T?
 ```
 that returns the first element matching the predicate.
 */

// Your code for 3j here:




/*:
 ### 3k) Demonstrate findFirst Usage
 Demonstrate using your `findFirst` function with:
 1. An array of `String`s
 2. An array of `Int`s
 */

// Your code for 3k here:

// With Strings:


// With Ints:



/*:
 ### 3l) Generic Stack
 Write a generic struct `Stack<Element>` with the following methods:
 - `mutating func push(_ element: Element)`
 - `mutating func pop() -> Element?`
 - `func peek() -> Element?`
 - `var isEmpty: Bool { get }`
 
 Demonstrate its usage with at least one type.
 */

// Your code for 3l here:




// Demonstrate usage:




/*:
 ---
 ## Exercise 4: Type Casting (10 points)
 
 ### 4m) Class Hierarchy
 Create a class hierarchy:
 - Base class `MediaItem` with a `title: String` property
 - Subclass `Movie` with a `director: String` property
 - Subclass `Song` with an `artist: String` property
 
 Include appropriate initializers for each class.
 */

// Your code for 4m here:




/*:
 ### 4n) Mixed Array
 Create an array of `MediaItem` containing a mix of `Movie` and `Song` instances (at least 5 items total).
 */

// Your code for 4n here:




/*:
 ### 4o) Count with `is`
 Use a `for` loop with `is` to count how many movies and songs are in the array.
 Print the counts.
 */

// Your code for 4o here:




/*:
 ### 4p) Downcast with `as?`
 Use `as?` to safely downcast items and print movie-specific or song-specific information.
 */

// Your code for 4p here:




/*:
 ---
 ## 🎉 Congratulations!
 
 You've completed the Swift Mastery exercises. Make sure to:
 1. Review your code for any errors
 2. Add comments where helpful
 3. Ensure everything compiles and runs
 
 OPTIONAL IF USING GIT:
 4. Commit your work to Git (minimum 3 commits)
 5. Create your Pull Request
 */
