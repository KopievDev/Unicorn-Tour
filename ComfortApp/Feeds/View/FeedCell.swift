//
//  FeedCell.swift
//  Team_UP
//
//  Created by Ekaterina Borobaenko on 05.05.2021.
//

import UIKit

class FeedCell: UITableViewCell {

    // MARK: - Properties
    private lazy var cellView = FeedsView()

    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     // MARK: - Helpers
    
    func createUI() {
        addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius = 16
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            

        ])
    }
    
    func configureCell(with feed: Tour) {
        cellView.feedImageView.image = UIImage(named: feed.image)
        cellView.nameLabel.text = feed.name
        cellView.descriptionLabel.text = feed.description
        cellView.kindOfSport.text = feed.country
        cellView.viewsLabel.text = "\(feed.stars)"
        cellView.likesLabel.text = "\(feed.price)"
        cellView.commentsLabel.text = "\(feed.numberOfComments)"

    }

}
