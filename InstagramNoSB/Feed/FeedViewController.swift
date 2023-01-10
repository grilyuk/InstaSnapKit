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
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftButtonBarItems()
        navigationItem.rightBarButtonItems = makeRightButtonBarItems()
        
    }
    
    func makeLeftButtonBarItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightButtonBarItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        let likedBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapLikedButton))
        return [addBarButtonItem, directBarButtonItem, likedBarButtonItem]
    }
    
    @objc func didTapPlusButton() {
        print("Plus")
    }
    
    @objc func didTapDirectButton() {
        print("Direct")
    }
    
    @objc func didTapLikedButton() {
        print("Like")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Favs")
        }
        
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}
