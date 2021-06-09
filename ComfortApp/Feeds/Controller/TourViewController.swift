//
//  FeedsViewController.swift
//  Unicorn-Tour
//
//  Created by Ekaterina Borobaenko on 05.05.2021.
//
import UIKit

class TourViewController: UIViewController {
 
    
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
        feedData.append(Tour(image: "egipt", name: "Sharming In( ex. PR Club Sharm Inn)", description: "До пляжа 30 метров", country: "Египет", stars: 4, price: 105566, numberOfComments: 342))
        feedData.append(Tour(image: "turk", name: "Alibaba djan", description: "Все включено(тенисный корт, баскетбольная площадка)", country: "Турция", stars: 5, price: 99800, numberOfComments: 313))
        feedData.append(Tour(image: "turk", name: "Alibaba Bro", description: "Все включено", country: "Турция", stars: 5, price: 88065, numberOfComments: 100))

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
extension TourViewController: UITableViewDataSource {
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
extension TourViewController: UITableViewDelegate {
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
