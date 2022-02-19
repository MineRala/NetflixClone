//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Mine Rala on 15.02.2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private let homeFeedTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeedTable)
        configureNavigationBar()
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        // Header'ın boyutlarını belirledim. Header -> Büyük fotoğraf kısmı.
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.homeFeedTable.frame = view.bounds
    }
    
    private func configureNavigationBar() {
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal) // image'ı orjinaline çevirir. (Renk, görüşünüş)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Celli'i guard'la kontrol edip doğruysa CollectionViewTableCell göstericek ya da normal default UITableviewCell gösterecek.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // NavigationBar'ı hareket ettiren fonksiyon. Y ekseni hesaplaması yaptık. offset kadar daha scroll olabiliyor. Yukarı tarafa doğru.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top // safeArea yukarı noktasını gösteriyor
        let offset = scrollView.contentOffset.y + defaultOffset // contentOffset.y ise navigationBar'ın y ekseni.
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset)) // y ekseni offset kadar yukarı gidebiliyor.
    }
}
