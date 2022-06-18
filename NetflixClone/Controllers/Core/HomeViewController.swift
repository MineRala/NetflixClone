//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Mine Rala on 15.02.2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Trendıng Movıes", "Trendıng Tv", "Popular Movıes", "Popular Tv", "Upcomıng Movıes", "Top Rated Movıes", "Top Rated Tv"]
    
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
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Celli'i guard'la kontrol edip doğruysa CollectionViewTableCell göstericek ya da normal default UITableviewCell gösterecek.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
            case Sections.TrendingMovies.rawValue:
            apiCallerForAllTypes(dataType: UrlForTitles.TrendingMovies.url, cell: cell)
                
            case Sections.TrendingTv.rawValue:
            apiCallerForAllTypes(dataType: UrlForTitles.TrendingTv.url, cell: cell)
                
            case Sections.PopularMovies.rawValue:
            apiCallerForAllTypes(dataType: UrlForTitles.PopularMovies.url, cell: cell)
                
            case Sections.PopularTv.rawValue:
            apiCallerForAllTypes(dataType: UrlForTitles.PopularTv.url, cell: cell)
                
            case Sections.UpcomingMovies.rawValue:
            apiCallerForAllTypes(dataType: UrlForTitles.UpcomingMovies.url, cell: cell)
                
            case Sections.TopRatedMovies.rawValue:
            apiCallerForAllTypes(dataType: UrlForTitles.TopRatedMovies.url, cell: cell)
                
            case Sections.TopRatedTv.rawValue:
            apiCallerForAllTypes(dataType: UrlForTitles.TopRatedTvs.url, cell: cell)
                
            default:
                return UITableViewCell()
            }
        
        return cell
    }
    
    func apiCallerForAllTypes(dataType:String, cell: CollectionViewTableViewCell) {
        APICaller.shared.getDatas(dataType: dataType) { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
   
    // HeaderView ile ilgili değiikliklerin yapıldığı fonskiyon
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black.withAlphaComponent(0.5)
        header.textLabel?.text = header.textLabel?.text?.capatilizeFirstLetter()
    }
    
    // NavigationBar'ı hareket ettiren fonksiyon. Y ekseni hesaplaması yaptık. offset kadar daha scroll olabiliyor. Yukarı tarafa doğru.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top // safeArea yukarı noktasını gösteriyor
        let offset = scrollView.contentOffset.y + defaultOffset // contentOffset.y ise navigationBar'ın y ekseni.
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset)) // y ekseni offset kadar yukarı gidebiliyor.
    }
}
