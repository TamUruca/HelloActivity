//
//  TabBarRouter.swift
//  HelloActivity
//
//  Created by mac on 30/08/2022.
//

import Foundation
import SwiftUI

class TabBarRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case job
    case chat
    case profile
    case setting
    case notification
    case login
    case newRegister
    case inbox
    case applicationList
}
