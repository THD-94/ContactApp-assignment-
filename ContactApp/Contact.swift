//
//  Contact.swift
//  ContactApp
//
//  Created by Trine Davidsen on 23/09/2024.
//

import SwiftUI

struct Contact: Identifiable {
    let id: UUID = UUID()
    let image: String
    let name: String
    let phoneNumber: String
    var isFavorite: Bool = false

    static let mocks = [
        Contact(
            image: "anna",
            name: "Anna Belina",
            phoneNumber: "901 34 483"
        ),
        Contact(
            image: "Carl",
            name: "Carl Revrud",
            phoneNumber: "934 12 117"
        ),
        Contact(
            image: "Nick",
            name: "Nick Arrow",
            phoneNumber: "329 12 239"
        ),
        Contact(
            image: "Maria",
            name: "Maria Rodgres",
            phoneNumber: "913 14 753"
        ),
        Contact(
            image: "Veronica",
            name: "Veronica Greet",
            phoneNumber: "989 84 213"
        )
    ]

}

