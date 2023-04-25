//
//  GCError.swift
//  GitComunity
//
//  Created by Makarov_Maxim on 20.04.2023.
//

import Foundation

enum GCError: String, Error {
    case invalidUsername = "Invalid username"
    case unableToCoplete = "Unable to complete request"
    case invalidResponse = "Invalid response from server"
    case invalidData = "Data is invalid"
    case unableToFavorite = "There was an error adding to favorites"
    case alreadyInFavorites = "You have already added to favorites this user"
    
}
