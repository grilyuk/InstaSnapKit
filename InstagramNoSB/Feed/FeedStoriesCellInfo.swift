//
//  FeedStoriesCellInfo.swift
//  InstagramNoSB
//
//  Created by Григорий Данилюк on 10.01.2023.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
