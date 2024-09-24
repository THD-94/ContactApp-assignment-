//
//  ArchivedContact.swift
//  ContactApp
//
//  Created by Trine Davidsen on 23/09/2024.
//

import SwiftUI

struct ArchivedContact: Identifiable {
    let id = UUID()
    let contact: Contact
    let archiveDate: Date
}
