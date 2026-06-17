# 📝 SimpleToDoApp

A simple SwiftUI to-do list app, built as a hands-on exercise to apply concepts from my [Swift learning series](https://dev.to/gamya_m) — variables, structs, functions, parameters, and return types.

## Features

- Add new to-do items via a text field and button
- View all to-dos in a scrollable list
- Delete items with swipe-to-delete
- Clean, commented code for easy reference

## Concepts Demonstrated

- **Structs** — `Todo` is a custom struct conforming to `Identifiable`
- **`@State` property wrapper** — used to keep the UI in sync with the `todos` array and the text field
- **Functions with parameters** — `addTodo(title:)` and `deleteTodo(at:)`
- **Array methods** — `.append()` and `.remove(atOffsets:)`
- **SwiftUI fundamentals** — `NavigationStack`, `VStack`, `HStack`, `TextField`, `Button`, `List`, `ForEach`, and the `.onDelete` modifier for swipe gestures

## Project Structure

```
SimpleToDoApp/
├── Todo.swift           # The Todo data model
├── ContentView.swift     # Main UI and app logic
├── SimpleToDoAppApp.swift  # App entry point
└── Assets.xcassets       # App icons and colors
```

## Running the App

1. Clone this repo
2. Open `SimpleToDoApp.xcodeproj` in Xcode
3. Select a simulator and press **Cmd + R** to run

## Acceptance Criteria Met

- ✅ App runs without errors
- ✅ Can add 3+ todos
- ✅ Can delete todos
- ✅ Code is readable with comments

Built as a practice project alongside my ongoing iOS development series. 🍥
