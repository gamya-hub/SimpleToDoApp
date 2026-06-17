//
//  ContentView.swift
//  SimpleToDoApp
//
//  Created by Gamya Madhuchetti on 6/17/26.
//

import SwiftUI
/* Brings in Apple's SwiftUI framework — gives us View, Text, Button, List, and everything else we need to build the UI */

struct ContentView: View {
    /* Declares our main view as a struct named ContentView
     : View means it conforms to SwiftUI's View protocol — basically saying "this thing knows how to draw itself on screen" */
    @State private var todos: [Todo] = []
    /* todos is an array of Todo items — starts empty ([])
     @State is a special SwiftUI property wrapper — it tells SwiftUI "watch this variable, and redraw the screen automatically whenever it changes." Without @State, adding a todo wouldn't visually update the list
     private just means this variable is only accessible within this struct — good practice for variables that don't need to be seen outside */
    @State private var newTodoTitle: String = ""
    /* This holds whatever text the user is currently typing into the text field
     Starts as an empty string
     Also @State, because SwiftUI needs to update the text field's display as the user types */

    var body: some View {
        /* Every SwiftUI view must have a body property — this is what actually gets drawn on screen
         some View means "this returns some specific type that conforms to View, but I'm not naming it explicitly" — Swift figures out the exact type */
        
        NavigationStack {
            /* Wraps our content in a navigation container — this is what lets us show a title bar at the top (and would let us push to new screens later, though we're not doing that yet) */
            
            VStack {
                // A vertical stack — arranges everything inside it top-to-bottom
                

                HStack {
                    // A horizontal stack — arranges everything inside it left-to-right. We're using this for the text field + button row
                    

                    TextField("Enter a new todo", text: $newTodoTitle)
                    /* Creates a text input box
                     "Enter a new todo" is placeholder text shown when the field is empty
                     text: $newTodoTitle — the $ here creates a binding, meaning the text field and newTodoTitle stay in sync automatically: typing updates the variable, and changing the variable updates what's shown */
                    
                        .textFieldStyle(.roundedBorder)
                    /* A modifier that gives the text field rounded, bordered styling (otherwise it looks very plain) */

                    Button("Add") {
                        addTodo(title: newTodoTitle)
                    }
                    /* Creates a button labeled "Add"
                     The code inside the { } runs when the button is tapped — here, it calls our addTodo function, passing in whatever's currently typed */
                }
                .padding()
                /* Closes the HStack, then adds padding (space) around it so it's not jammed against the screen edges */

                List {
                    ForEach(todos) { todo in
                        Text(todo.title)
                    }
                    .onDelete(perform: deleteTodo)
                }
                /* List creates a scrollable list container
                 ForEach(todos) loops through every item in our todos array
                 For each one (todo), it displays Text(todo.title) — just the title text
                 Since Todo conforms to Identifiable, SwiftUI automatically knows how to tell each row apart
                 .onDelete is a special modifier that only works inside a ForEach within a List
                 It enables the standard iOS swipe-to-delete gesture on each row
                 perform: deleteTodo tells it which function to call when the user swipes and confirms delete — note we're passing the function itself (no parentheses), not calling it directly
                 SwiftUI automatically figures out which row(s) were swiped and passes that information along when it calls deleteTodo
                 
                 */
            }
            .navigationTitle("My Todos")
            /*   Closes the VStack, then sets the title shown at the top of the screen to "My Todos"
              */
        }
    }
// Closes NavigationStack, then closes body
    

    func addTodo(title: String) {
        let newTodo = Todo(title: title)
        todos.append(newTodo)
        newTodoTitle = ""
    }
    /* Our custom function, taking a title: String parameter
     Creates a new Todo using that title
     todos.append(newTodo) adds it to the end of our array — this triggers SwiftUI to redraw the list (because todos is @State)
     Clears the text field by resetting newTodoTitle back to empty */
    func deleteTodo(at offsets: IndexSet) {
            todos.remove(atOffsets: offsets)
        }
    /* A new function named deleteTodo
     at offsets: IndexSet — IndexSet is a special type that represents a collection of array positions (indexes). When you swipe to delete a row, SwiftUI sends in the index/indexes of whatever row(s) were swiped
     at is the external label (used by .onDelete, though here it actually uses the parameter name perform: since that's the modifier's own naming — let me clarify that contradiction below)
     todos.remove(atOffsets: offsets) — this is a built-in array method that removes items at the given positions. Since todos is @State, removing an item automatically triggers SwiftUI to redraw the list

     A small note: .onDelete(perform:) doesn't actually use your function's parameter label (at) — it just needs a function that accepts an IndexSet and matches the expected shape. The at label is just for readability if you called deleteTodo yourself elsewhere in your code. */
    
}

#Preview {
    ContentView()
}
/* Closes ContentView
 #Preview lets Xcode show a live preview of this view in the canvas, without running the full simulator */
