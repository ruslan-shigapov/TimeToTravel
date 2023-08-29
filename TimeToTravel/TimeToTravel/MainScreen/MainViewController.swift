//
//  MainViewController.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FlightCell.self, forCellReuseIdentifier: "FlightCell")
        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    private var viewModel: MainViewModelProtocol! {
        didSet {
            viewModel.fetchFlights { [weak self] in
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }
    }

    // MARK: - Lifecycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        viewModel = MainViewModel()
        
        title = "Пора в путешествие"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
                        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - Table view data source 
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FlightCell",
            for: indexPath
        )
        guard let cell = cell as? FlightCell else { return UITableViewCell() }
        cell.viewModel = viewModel.getFlightCellViewModel(at: indexPath)
        return cell
    }
}

// MARK: - Table view delegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = DetailsViewController()
        detailsVC.viewModel = viewModel.getDetailsViewModel(at: indexPath)
        present(detailsVC, animated: true)
    }
}

