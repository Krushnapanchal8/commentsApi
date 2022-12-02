//
//  Comments.swift
//  commentsApi
//
//  Created by Mac on 01/12/22.
//

import Foundation



struct Comments : Decodable {
    let postId, id: Int
    let name, email, body: String
}
