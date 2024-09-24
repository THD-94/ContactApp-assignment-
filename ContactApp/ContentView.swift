//
//  ContentView.swift
//  ContactApp
//
//  Created by Trine Davidsen on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    // Lager en liste med arkiverte kontakter
    @State private var archivedContacts: [ArchivedContact] = Contact.mocks.map {
        ArchivedContact(contact: $0, archiveDate: Date())
    }

    // Holder oversikt over den valgte kontakten
    @State private var selectedContact: ArchivedContact?
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Favorites")
                        .font(.largeTitle)
                        .padding(.leading)
                    
                    let favoriteContacts = archivedContacts.filter { favorite in favorite.contact.isFavorite }
                    
                    if !favoriteContacts.isEmpty {
                        LazyVGrid(columns: [GridItem(.flexible())]) {
                            ForEach(favoriteContacts) { archivedContact in
                                VStack {
                                    Image(archivedContact.contact.image)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                    
                                    Text(archivedContact.contact.name)
                                    
                                    Button(action: {
                                        
                                    }) {
                                        Label("Call", systemImage: "phone.fill")
                                    }
                                }
                                .padding()
                            }
                        }
                    } else {
                        Text("No favorites")
                            .padding(.leading)
                    }

                    Divider()
                    
                    Text("Contacts")
                        .font(.largeTitle)
                        .padding(.leading)
                    
                    List(archivedContacts) { archivedContact in
                        HStack {
                            Image(archivedContact.contact.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(archivedContact.contact.name)
                                    .font(.headline)
                                Text(archivedContact.contact.phoneNumber)
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                        }
                        .onTapGesture {
                            selectedContact = archivedContact
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Contacts")
            .sheet(item: $selectedContact) { contact in
                ContactDetailSheet(contact: contact)
            }
        }
    }

    // Funksjon for å initiere et telefonanrop (simulering)
    private func initiatePhoneCall(for contact: Contact) {
        print("Calling \(contact.name) at \(contact.phoneNumber)")
    }
}

#Preview {
    ContentView()
}
