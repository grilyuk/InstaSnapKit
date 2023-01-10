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
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([FeedStoriesItemCellInfo(image: UIImage(named: "Cat")!, username: "Barsik", isAddButtonVisible: true, isNewStory: false),
                  FeedStoriesItemCellInfo(image: UIImage(named: "Cat")!, username: "Barsik", isAddButtonVisible: false, isNewStory: true),
                  FeedStoriesItemCellInfo(image: UIImage(named: "Cat")!, username: "Barsik", isAddButtonVisible: false, isNewStory: true),
                  FeedStoriesItemCellInfo(image: UIImage(named: "Cat")!, username: "Barsik", isAddButtonVisible: false, isNewStory: true),
                  FeedStoriesItemCellInfo(image: UIImage(named: "Cat")!, username: "Barsik", isAddButtonVisible: false, isNewStory: true),
                  FeedStoriesItemCellInfo(image: UIImage(named: "Cat")!, username: "Barsik", isAddButtonVisible: false, isNewStory: true),
                  FeedStoriesItemCellInfo(image: UIImage(named: "Cat")!, username: "Barsik", isAddButtonVisible: false, isNewStory: false),
                  FeedStoriesItemCellInfo(image: UIImage(named: "Cat")!, username: "Barsik", isAddButtonVisible: false, isNewStory: false),
                 ]),
        .post(FeedPostItemInfo(userImage: UIImage(named: "Dog")!, username: "Chezik", postSubtitle: "Sponsored", postImage: UIImage(named: "Dog")!, numberOfLikes: 341, comment: CommentShortInfo(username: "Zhora", commentText: "Barsik salam")))
    ]
}

//MARK: -Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftButtonBarItems()
        navigationItem.rightBarButtonItems = makeRightButtonBarItems()
        view.addSubview(tableView)
        tableView.separatorColor = .clear
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
//        tableView.delegate = self
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

//MARK: - UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
            
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
    
    
}
