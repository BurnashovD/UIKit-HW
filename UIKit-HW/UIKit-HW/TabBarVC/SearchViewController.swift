//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Класс поиска товара
final class SearchViewController: UIViewController {
    
    // MARK: - Visual components
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 45, width: 180, height: 50)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.text = Constants.searchText
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        return label
    }()
    
    private lazy var recentlyCheckedLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 170, width: 280, height: 50)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        label.text = Constants.recentlySearchedText
        return label
    }()
    
    private lazy var clearSearchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 285, y: 180, width: 100, height: 30)
        button.setTitle(Constants.deleteText, for: .normal)
        button.tintColor = UIColor.red
        return button
    }()
    
    private lazy var searchControl: UISearchController = {
        let search = UISearchController()
        search.searchBar.frame = CGRect(x: 50, y: 50, width: 200, height: 40)
        return search
    }()
    
    private lazy var macCaseView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 230, width: 120, height: 150)
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        view.layer.cornerRadius = 10
        view.tag = 0
        return view
    }()
    
    private lazy var watchCaseView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 160, y: 230, width: 120, height: 150)
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        view.layer.cornerRadius = 10
        view.tag = 1
        return view
    }()
    
    private lazy var brownCaseView: UIView = {
        let view = UIImageView()
        view.frame = CGRect(x: 300, y: 230, width: 120, height: 150)
        view.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        view.layer.cornerRadius = 10
        view.tag = 2
        return view
    }()
    
    private lazy var searchVariantsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 430, width: 280, height: 30)
        label.textColor = .white
        label.text = Constants.searchedVariantsText
        label.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        return label
    }()
    
    private lazy var airPodsLabel: UIButton = {
        let label = UIButton()
        label.frame = CGRect(x: 10, y: 480, width: 150, height: 30)
        label.setTitle(Constants.airPodsText, for: .normal)
        label.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        label.tintColor = .gray
        return label
    }()
    
    private lazy var appleCareLabel: UIButton = {
        let label = UIButton()
        label.frame = CGRect(x: 20, y: 530, width: 150, height: 30)
        label.setTitle(Constants.appleCareText, for: .normal)
        label.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        label.tintColor = .gray
        return label
    }()
    
    private lazy var beatsLabel: UIButton = {
        let label = UIButton()
        label.frame = CGRect(x: 2, y: 580, width: 150, height: 30)
        label.setTitle(Constants.beatsText, for: .normal)
        label.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        label.tintColor = .gray
        return label
    }()
    
    private lazy var iphoneLabel: UIButton = {
        let label = UIButton()
        label.frame = CGRect(x: 35, y: 630, width: 250, height: 30)
        label.setTitle(Constants.iphoneText, for: .normal)
        label.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        label.tintColor = .gray
        return label
    }()
    
    private lazy var blackCaseNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 25, y: 270, width: 120, height: 150)
        label.text = Constants.blackCaseNameText
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var watchNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 165, y: 270, width: 120, height: 150)
        label.text = Constants.watchNameText
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var brownCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 305, y: 270, width: 120, height: 150)
        label.text = Constants.brownCaseText
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var blackCaseImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 35, y: 245, width: 90, height: 70)
        image.image = UIImage(named: Constants.blackCaseImage)
        return image
    }()
    
    private lazy var watchImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 187, y: 245, width: 60, height: 70)
        image.image = UIImage(named: Constants.watchImage)
        return image
    }()
    
    private lazy var brownCaseImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 320, y: 230, width: 100, height: 100)
        image.image = UIImage(named: Constants.brownCaseImage)
        return image
    }()
    // MARK: - Private properties
    private lazy var tapBlack = UITapGestureRecognizer(target: self, action: #selector(goToBlackCaseVCAction))
    private lazy var tapWatch = UITapGestureRecognizer(target: self, action: #selector(goToWatchVCAction))
    private lazy var tapBrown = UITapGestureRecognizer(target: self, action: #selector(goToBrownCaseVCAction))
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        configTabBar()
        view.backgroundColor = .black
        view.addSubview(searchLabel)
        view.addSubview(recentlyCheckedLabel)
        view.addSubview(clearSearchButton)
        view.addSubview(macCaseView)
        view.addSubview(watchCaseView)
        view.addSubview(brownCaseView)
        view.addSubview(searchVariantsLabel)
        view.addSubview(airPodsLabel)
        view.addSubview(appleCareLabel)
        view.addSubview(beatsLabel)
        view.addSubview(iphoneLabel)
        view.addSubview(blackCaseNameLabel)
        view.addSubview(watchNameLabel)
        view.addSubview(brownCaseLabel)
        view.addSubview(blackCaseImageView)
        view.addSubview(watchImageView)
        view.addSubview(brownCaseImageView)
        navigationItem.searchController = searchController
        macCaseView.addGestureRecognizer(tapBlack)
        watchCaseView.addGestureRecognizer(tapWatch)
        brownCaseView.addGestureRecognizer(tapBrown)
    }
    
    private func configTabBar() {
        tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        tabBarController?.tabBar.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.00)
        searchController.searchBar.placeholder = "Поиск по продуктам и магазинам"
    }
    
    @objc private func goToBlackCaseVCAction() {
        let chosenItemVC = ChosenItemViewController()
        chosenItemVC.productName = Constants.blackCaseNameText
        chosenItemVC.productImage = Constants.blackCaseImage
        navigationController?.pushViewController(chosenItemVC, animated: false)
    }
    
    @objc private func goToWatchVCAction() {
        let chosenItemVC = ChosenItemViewController()
        chosenItemVC.productName = Constants.watchNameText
        chosenItemVC.productImage = Constants.watchImage
        navigationController?.pushViewController(chosenItemVC, animated: false)
    }
    
    @objc private func goToBrownCaseVCAction() {
        let chosenItemVC = ChosenItemViewController()
        chosenItemVC.productName = Constants.brownCaseText
        chosenItemVC.productImage = Constants.brownCaseImage
        navigationController?.pushViewController(chosenItemVC, animated: false)
    }
}

extension SearchViewController {
    enum Constants {
        static let searchText = "Поиск"
        static let recentlySearchedText = "Недавно просмотренные"
        static let deleteText = "Очистить"
        static let searchedVariantsText = "Варианты запросов"
        static let airPodsText = " AirPods"
        static let appleCareText = " AppleCare"
        static let beatsText = " Beats"
        static let iphoneText = " Сравните модели IPhone"
        static let blackCaseNameText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let watchNameText = "Спортивный ремешок Black Unity"
        static let brownCaseText = "Кожаный чехол для MacBook Pro 16 дюймов"
        static let blackCaseImage = "blackCase"
        static let watchImage = "watchCase"
        static let brownCaseImage = "brownCase"
    }
}
