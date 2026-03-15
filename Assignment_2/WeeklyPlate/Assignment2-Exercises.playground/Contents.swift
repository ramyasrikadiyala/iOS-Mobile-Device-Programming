/*:
 # CSCI 321/521 Assignment 2
 ## Part B: Swift Mastery Exercises
 
 Complete each exercise below. Your code should compile and run without errors.
 
 **Student Name:Ramya**
 **Z-ID:**
 **Partner Name (if applicable):**
 **Partner Z-ID (if applicable):**
 
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
    let allowed = CharacterSet.alphanumerics
    guard username.unicodeScalars.allSatisfy({ allowed.contains($0) }) else {
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
let optionalUsername: String? = try? validateUsername("helloworld")
let validOptional: String? = try? validateUsername("validUser")
print("Optional invalid: \(String(describing: optionalUsername))")
print("Optional valid: \(String(describing: validOptional))")

// Using try! (with a safe value):
let forcedUsername = try! validateUsername("safeUsername")
print("Forced username: \(forcedUsername)")


/*:
 ### 1d) When to Use Each Approach
 Write a comment explaining when you would use each approach: `do-catch` vs `try?` vs `try!`
 */

/*
 Your explanation for 1d here:
 
 do-catch: Use when you need to handle specific error cases differently.
            For example, showing "field is empty" vs "username too long"
            are different messages. Most production code uses do-catch.
  
  try?:     Use when failure is acceptable and nil is a valid outcome.
            Good for optional lookups where not finding a value is normal.
  
  try!:     Use only with hardcoded values you are completely sure will
            not throw. If it throws, the app crashes immediately.
            Never use with user input or network data.
 
 
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
protocol Displayable {
    var title: String { get }
    var subtitle: String { get }
    func formattedDescription() -> String
}


/*:
 ### 2f) Conform Your Primary Model
 Copy your primary model from Part A (or create a simplified version) and make it conform to `Displayable`.
 
 **Note:** If you haven't completed Part A yet, create a simple model like `Book` or `Task` with a few properties.
 */

// Your code for 2f here:
struct Meal: Identifiable {
    let id: String
    let name: String
    let category: String
    let area: String?
    let instructions: String?
    let thumbnailURL: String
    var isFavorite: Bool
    let youtubeURL: String?
    var ingredientSummary: String { return "7 ingredients" }
}

extension Meal: Displayable {
    var title: String { return name }
    var subtitle: String {
        if let area = area {
            return "\(category) - \(area)"
        }
        return category
    }
    func formattedDescription() -> String {
        return "Meal: \(name) | \(subtitle) | \(ingredientSummary)"
    }
}

let meal = Meal(id: "52772", name: "Butter Chicken", category: "Chicken", area: "Indian", instructions: nil, thumbnailURL: "", isFavorite: false, youtubeURL: nil)


/*:
 ### 2g) Second Conforming Type
 Create a second, unrelated struct (e.g., `Event`, `Product`, `Contact`) that also conforms to `Displayable`.
 */

// Your code for 2g here:
struct PlannerEvent: Identifiable, Displayable {
    let id: String
    let dayLabel: String
    let mealName: String
    let isConfirmed: Bool
    var title: String { return "\(dayLabel): \(mealName)" }
    var subtitle: String {
        if isConfirmed {
            return "Confirmed"
        } else {
            return "Pending"
        }
    }
    func formattedDescription() -> String {
        return "Event: \(title) | Status: \(subtitle)"
    }
}

let event = PlannerEvent(id: "1", dayLabel: "MON", mealName: "Butter Chicken", isConfirmed: true)
print(event.formattedDescription())

/*:
 ### 2h) Print Info Function
 Write a function `printInfo(for item: Displayable)` that prints the formatted description.
 */

// Your code for 2h here:
func printInfo(for item: Displayable) {
    print(item.formattedDescription())
}

/*:
 ### 2i) Demonstrate Protocol Usage
 Demonstrate calling `printInfo` with instances of both conforming types.
 */

// Your code for 2i here:
let meal2 = Meal(id: "52767", name: "Pasta Bolognese", category: "Beef", area: "Italian", instructions: nil, thumbnailURL: "", isFavorite: false, youtubeURL: nil)

let event2 = PlannerEvent(id: "2", dayLabel: "FRI", mealName: "Pasta Bolognese", isConfirmed: false)

print("--- Meal instances ---")
printInfo(for: meal)
printInfo(for: meal2)

print("--- PlannerEvent instances ---")
printInfo(for: event)
printInfo(for: event2)

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
func findFirst<T: Equatable>(in array: [T], where predicate: (T) -> Bool) -> T? {
    for element in array {
        if predicate(element) {
            return element
        }
    }
    return nil
}

/*:
 ### 3k) Demonstrate findFirst Usage
 Demonstrate using your `findFirst` function with:
 1. An array of `String`s
 2. An array of `Int`s
 */

// Your code for 3k here:
// With Strings:
let mealNames = ["Tacos", "Butter Chicken", "Sushi", "Pasta Bolognese", "Rice"]
let firstLongName = findFirst(in: mealNames, where: { $0.count > 5 })
print("First meal longer than 5 chars: \(firstLongName ?? "Not found")")

// With Ints:
let scores = [42, 55, 78, 91, 63, 88]
let firstHighScore = findFirst(in: scores, where: { $0 >= 90 })
print("First score >= 90: \(firstHighScore ?? -1)")


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
struct Stack<Element> {
    private var elements: [Element] = []
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    mutating func pop() -> Element? {
        return elements.popLast()
    }
    func peek() -> Element? {
        return elements.last
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
}



// Demonstrate usage:
var recipeStack = Stack<String>()
recipeStack.push("Pasta Carbonara")
recipeStack.push("Tacos")
recipeStack.push("Sushi")
print("Top: \(recipeStack.peek() ?? "empty")")
print("Is empty: \(recipeStack.isEmpty)")
let popped = recipeStack.pop()
print("Popped: \(popped ?? "empty")")
print("Top after pop: \(recipeStack.peek() ?? "empty")")



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
class MediaItem {
    let title: String
    init(title: String) {
        self.title = title
    }
}

class Movie: MediaItem {
    let director: String
    init(title: String, director: String) {
        self.director = director
        super.init(title: title)
    }
}

class Song: MediaItem {
    let artist: String
    init(title: String, artist: String) {
        self.artist = artist
        super.init(title: title)
    }
}
let mediaLibrary: [MediaItem] = [
    Movie(title: "The Chef", director: "Jon Favreau"),
    Song(title: "Kitchen Sink", artist: "Twenty One Pilots"),
    Movie(title: "Julie and Julia", director: "Nora Ephron"),
    Song(title: "Food", artist: "Various Artists"),
    Movie(title: "Ratatouille", director: "Brad Bird")
]


/*:
 ### 4o) Count with `is`
 Use a `for` loop with `is` to count how many movies and songs are in the array.
 Print the counts.
 */

// Your code for 4o here:
var movieCount = 0
var songCount = 0
for item in mediaLibrary {
    if item is Movie { movieCount += 1 }
    if item is Song { songCount += 1 }
}
print("Movies: \(movieCount), Songs: \(songCount)")



/*:
 ### 4p) Downcast with `as?`
 Use `as?` to safely downcast items and print movie-specific or song-specific information.
 */

// Your code for 4p here:
print("--- Movie details ---")
for item in mediaLibrary {
    if let movie = item as? Movie {
        print("Movie: \(movie.title) directed by \(movie.director)")
    }
}

print("--- Song details ---")
for item in mediaLibrary {
    if let song = item as? Song {
        print("Song: \(song.title) by \(song.artist)")
    }
}


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
