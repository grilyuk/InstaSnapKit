//
//  FeedPostCell.swift
//  InstagramNoSB
//
//  Created by Григорий Данилюк on 10.01.2023.
//

import SnapKit
import UIKit

class FeedPostCell: UITableViewCell {
    //MARK: - Public
    func configure(with info: FeedPostItemInfo) {
        userImageView.image = info.userImage
        usernameLabel.text = info.username
        subtitleLabel.text = info.postSubtitle
        postImageView.image = info.postImage
        likesLabel.text = "\(info.numberOfLikes) Likes"
        if let comment = info.comment {
            configureComment(with: comment)
        }
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constants
    private enum UIConstants {
        static let userImageSize: CGFloat = 30
        static let contentInset: CGFloat = 12
        static let userImageTopInset: CGFloat = 6
        static let usernameLabelFontSize: CGFloat = 14
        static let subtitleLabelFontSize: CGFloat = 10
        static let usernameStackToProfileImage: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        static let actionsStackHeight: CGFloat = 24
        static let actionsStackToImagePostOffset: CGFloat = 6
        static let actionsStackSpacing: CGFloat = 12
        static let likesLabelToActionsStackOffset: CGFloat = 12
        static let likesLabelFontSize: CGFloat = 16
        static let commentLabelFontSize: CGFloat = 14
        static let commentToLikesOffset: CGFloat = 12
    }
    
    //MARK: - Private properties
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFontSize, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subtitleLabelFontSize)
        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let postImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.likesLabelFontSize, weight: .bold)
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.commentLabelFontSize)
        return label
    }()


}

//MARK: - Private methods
private extension FeedPostCell {
    func initialize() {
        selectionStyle = .none
        
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview().inset(UIConstants.userImageTopInset)
            make.size.equalTo(UIConstants.userImageSize)
        }
        
        let usernameStack = UIStackView()
        usernameStack.axis = .vertical
        usernameStack.addArrangedSubview(usernameLabel)
        usernameStack.addArrangedSubview(subtitleLabel)
        contentView.addSubview(usernameStack)
        usernameStack.snp.makeConstraints{ make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.usernameStackToProfileImage)
        }
        
        contentView.addSubview(optionsButton)
        optionsButton.snp.makeConstraints{make in
            make.top.trailing.equalToSuperview().inset(UIConstants.contentInset)
        }
        
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints{make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(UIConstants.postImageToUserImageOffset)
            make.height.equalTo(contentView.snp.width)
        }
        
        let actionsStack = UIStackView()
        actionsStack.axis = .horizontal
        actionsStack.spacing = UIConstants.actionsStackSpacing
        actionsStack.addArrangedSubview(likeButton)
        actionsStack.addArrangedSubview(commentButton)
        actionsStack.addArrangedSubview(shareButton)
        contentView.addSubview(actionsStack)
        actionsStack.snp.makeConstraints{ make in
            make.height.equalTo(UIConstants.actionsStackHeight)
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionsStackToImagePostOffset)
        }
        
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(actionsStack.snp.bottom).offset(UIConstants.likesLabelToActionsStackOffset)
        }
        
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(likesLabel.snp.bottom).offset(UIConstants.commentToLikesOffset)
            make.bottom.equalToSuperview().inset(UIConstants.contentInset)
        }
    }
    
    func configureComment(with comment: CommentShortInfo) {
        let string = comment.username + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.username.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.commentLabelFontSize), range: range)
        commentLabel.attributedText = attributedString
    }

}
