//
//  ContactDetailSheet.swift
//  ContactApp
//
//  Created by Trine Davidsen on 23/09/2024.
//

import SwiftUI

struct ContactDetailSheet: View {
    let contact: ArchivedContact
    
    var body: some View {
        VStack {
            // Viser bildet
            Image(contact.contact.image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .padding()
            
            Text(contact.contact.name)
                .font(.largeTitle)
                .padding(.top)
            
            Text(contact.contact.phoneNumber)
                .font(.title2)
                .padding(.bottom)
            
            Text("Archived on \(contact.archiveDate.formatted(.dateTime))")
                .padding(.bottom)
            
            Image(systemName: contact.contact.isFavorite ? "star.fill" : "star")
                .foregroundColor(contact.contact.isFavorite ? .yellow : .gray)
        }
        .padding()
    }
}

#Preview {
    ContactDetailSheet(contact: ArchivedContact(contact: Contact(
        image: "anna",
        name: "Anna Menu",
        phoneNumber: "901 34 483"
    ), archiveDate: Date()))
}
