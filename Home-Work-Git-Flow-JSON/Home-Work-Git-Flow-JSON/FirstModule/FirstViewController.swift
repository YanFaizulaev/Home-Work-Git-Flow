//
//  FirstViewController.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate {
    // MARK: - Индикатор загрузки
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .green
        return view
    }()
    // MARK: - Жизненый цикл

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
        configureTableView()
        setupConstraints()
        
        loadContents(query: searchBar.text ?? "")
    }
    
    private func setupViews () {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        tableView.backgroundColor = .white
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    // MARK: - Работа с запросом с сервара
    
    private var results: [Results] = []
        
    private func loadImage(urlString: String) -> UIImage? {
            guard
                let url = URL(string: urlString),
                let data = try? Data(contentsOf: url)
            else {
                print("Ошибка, не удалось загрузить изображение.")
                return nil
            }
            
            return UIImage(data: data)
        }
        
    private func loadContents(query: String) {
            let urlString = "https://imdb-api.com/en/API/Search/k_w7db8734/\(query)"
            guard let url = URL(string: urlString) else {
                return
            }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else { return }
                    do {
                        let decoder = try JSONDecoder().decode(APIResponse.self, from: data)
                        self.results = decoder.results
                        DispatchQueue.main.async {
                            self.activityIndicator.stopAnimating()
                            self.tableView.reloadData()
                        }
                        print(decoder.results)
                        print("Успех, данные получены с сервера.")
                    } catch {
                        print(error)
                        print("Ошибка, читай выше.")
                    }
                }.resume()
        }
    // MARK: - Работа c ячейками в таблице
    
    private let idCell = "idCell"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        return tableView
    }()
    
    private func configureTableView() {
        tableView.register(FirstViewControllerCell.self,forCellReuseIdentifier: "idCell")

        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - Работа с SearchBar
    
    private let searchBar = UISearchBar()
    
    private func configureUI() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        navigationItem.title = "Найди свой фильм"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(hexString: "03fc1c")]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(hexString: "03fc1c")]
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hexString: "106619")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance =  navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.tintColor = UIColor(hexString: "03fc1c")
        showSearchBarButton(shouldShow: true)
    }
    
    private func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    @objc func handleShowSearchBar() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }
    
    private func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
}
    // MARK: - Работа с расширениями

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contents = results[indexPath.row]
        let urlString = contents.image
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = contents.title
        configuration.secondaryText = contents.resultDescription
        configuration.image = loadImage(urlString: urlString)
        cell.contentConfiguration = configuration
        return cell
    }
}

extension FirstViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Пользователь начал ввод данных..")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Пользователь закончил ввод данных..")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Пользователь вводит \(searchText)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        activityIndicator.startAnimating()
        if let text = searchBar.text {
            loadContents(query: text)
        } else { return }
    }
}
