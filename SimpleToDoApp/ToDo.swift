//
//  ToDo.swift
//  SimpleToDoApp
//
//  Created by Gamya Madhuchetti on 6/17/26.
// this file defines what a single to-do item looks like — it has a unique ID (for SwiftUI to track it) and a title (the actual task text). We haven't created any actual to-dos yet — this is just the blueprint. 😊

import Foundation
/* Foundation is one of Apple's core frameworks — it gives us basic building blocks like UUID, Date, String utilities, and more
We need it specifically because we're about to use UUID in the next line */

struct Todo: Identifiable {
    /* This declares a struct named Todo — think of a struct as a custom "blueprint" for a type of data, similar to how Int or String are types, except we're defining our own
     : Identifiable means Todo conforms to the Identifiable protocol — this is a built-in Swift/SwiftUI requirement that says "every instance of this type must have a unique id"
     SwiftUI specifically needs this for displaying lists — it uses the id to know which row is which, especially when the list changes (like when we delete an item)*/
    let id = UUID()
    /* id is a property (a piece of data that every Todo will have)
     UUID() generates a Universally Unique Identifier — basically a guaranteed-unique random string like A1B2C3D4-...
     It's declared with let, meaning constant — once a Todo is created, its id never changes
     This satisfies the Identifiable protocol's requirement automatically*/
    var title: String
    /* title is the actual text of the to-do item, like "Buy groceries"
     It's var (variable), meaning it can change later if needed — though in our simple app, we probably won't edit titles after creating them, but var gives us that flexibility
     Type is String, since a to-do title is just text*/
} // closes the struct definition
