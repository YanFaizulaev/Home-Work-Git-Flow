//
//  ThirdViewController.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate {
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
    // MARK: - Работа c ячейками в таблице
    
    private let idCell = "idCell"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        return tableView
    }()
    
    private func configureTableView() {
        tableView.register(CustomTableViewCell.self,forCellReuseIdentifier: idCell)

        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - Работа с SearchBar
    
    private let searchBar = UISearchBar()
    
    private func configureUI() {
        searchBar.sizeToFit()
        
        navigationItem.title = "Комментарии"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(hexString: "03fc1c")]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(hexString: "03fc1c")]
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hexString: "106619")
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance =  navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.tintColor = UIColor(hexString: "03fc1c")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play,
                                                            target: self,
                                                            action: #selector(handleShowSearchBar))
    }

    @objc func handleShowSearchBar() {
        activityIndicator.startAnimating()
        getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments!
                    print(comments ?? "Успех")
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
// MARK: - Работа с запросом с сервара

    private var comments: [Comments] = []

    func getComments(completion: @escaping (Result<[Comments]?,Error>) -> Void) {
        let urlString = "http://jsonplaceholder.typicode.com/posts/1/comments"
        guard let url = URL(string: urlString) else { return }
    
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([Comments].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
// MARK: - Работа с расширениями

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! CustomTableViewCell
        let contents = comments[indexPath.row]
            cell.labelUserName.text = contents.name
            cell.labelEmail.text = contents.email
            cell.labelMessage.text = contents.body
        return cell
    }
}
