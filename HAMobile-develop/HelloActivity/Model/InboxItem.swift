//
//  InboxItem.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/21/22.
//

import SwiftUI

struct InboxItem: Hashable {
    let activityName: String
    let activityStatus: Int
    let activityId: String
    let inboxContent: String
    let inboxImage: String
    let inboxTime: String
    let typeInboxItem: TypeItemInbox
}
