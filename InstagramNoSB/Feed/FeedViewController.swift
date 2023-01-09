//
//  FeedViewControler.swift
//  InstagramNoSB
//
//  Created by Григорий Данилюк on 10.01.2023.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {
    //MARK: -View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

//MARK: -Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
    }
}
