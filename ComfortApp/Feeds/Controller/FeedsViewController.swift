//
//  FeedsViewController.swift
//  Team_UP
//
//  Created by Ivan Kopiev on 05.06.2021.
//
import UIKit

class FeedsViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tabBarItem = UITabBarItem(title: "Туры", image: #imageLiteral(resourceName: "vns"), tag: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Свойства
    private let cellId = "cell"
    private lazy var feedTableView: UITableView = {
        let table = UITableView(frame: view.frame, style: .plain)
        table.register(FeedCell.self, forCellReuseIdentifier: cellId)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.estimatedRowHeight = 300
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        table.backgroundColor = .clear
        return table
    }()
    
    var feedData = [Tour]() // Массив с объектами
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        feedData.append(Tour(image: "egipt", name: "Sharming In( ex. PR Club Sharm Inn)", description: "До пляжа 30 метров", country: "Египет", numberOfViews: 4, numberOfLikes: 105566, numberOfComments: 342))
        feedData.append(Tour(image: "turk", name: "Alibaba djan", description: "Все включено(тенисный корт, баскетбольная площадка)", country: "Турция", numberOfViews: 5, numberOfLikes: 99800, numberOfComments: 313))
        feedData.append(Tour(image: "turk", name: "Alibaba djan", description: "Все включено(тенисный корт, баскетбольная площадка)", country: "Турция", numberOfViews: 5, numberOfLikes: 99800, numberOfComments: 313))

    }
    
    
    // MARK: - Helpers
    
    func createUI() {
        navigationController?.navigationBar.isHidden = true
        setBackground()
        view.addSubview(feedTableView)
    }
    func setBackground() {
        let back = UIImageView(image: blurImage(usingImage: UIImage(named: "background"), blurAmount: 15))
        back.contentMode = .scaleAspectFill
        back.frame = view.frame
        view.addSubview(back)
    }
}
// MARK: - Extension DataSource
extension FeedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return configure(cell: cell, at: indexPath)
    }
    
    func configure(cell: UITableViewCell, at indexPath: IndexPath) -> FeedCell {
        guard let newCell = cell as? FeedCell else { return FeedCell()}
        newCell.configureCell(with: feedData[indexPath.row])
        return newCell
    }
    
    
}
// MARK: - Extension Delegate
extension FeedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: 183, height: 40))
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.text = "Туры"
        return titleLabel
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}
