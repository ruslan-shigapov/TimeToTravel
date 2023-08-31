//
//  DetailsViewController.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var adLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Лучшая цена за 1 пассажира на WB Travel"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private lazy var directionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(name: "Bradley Hand", size: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoStackView)
        view.addSubview(likeImageView)
        view.addSubview(likeButton)
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [departureStackView, arrivalStackView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var departureStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [startDateLabel, startLocationLabel]
        )
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var startLocationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var arrivalStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [endDateLabel, endLocationLabel]
        )
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var endLocationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .orange
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "CustomBlue")
        button.setTitle("Мне нравится", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()

    // MARK: - Public Properties
    var viewModel: DetailsViewModelProtocol! {
        didSet {
            priceLabel.text = viewModel.price
            directionLabel.text = viewModel.direction
            startDateLabel.text = viewModel.startDate
            startLocationLabel.text = viewModel.startLocation
            endDateLabel.text = viewModel.endDate
            endLocationLabel.text = viewModel.endLocation
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backgroundView.layer.cornerRadius = 10
        likeButton.layer.cornerRadius = 10
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = UIColor(named: "CustomBlue")
        view.addSubview(priceLabel)
        view.addSubview(adLabel)
        view.addSubview(directionLabel)
        view.addSubview(backgroundView)
        setupBackBarButtonItem()
    }
    
    private func setupBackBarButtonItem() {
        let backButton = UIBarButtonItem()
        backButton.title = "Все билеты"
        backButton.tintColor = .white
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor
            ),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            adLabel.topAnchor.constraint(
                equalTo: priceLabel.bottomAnchor,
                constant: 8
            ),
            adLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adLabel.widthAnchor.constraint(equalToConstant: 210),
            
            directionLabel.topAnchor.constraint(
                equalTo: adLabel.bottomAnchor,
                constant: 50),
            directionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            
            backgroundView.topAnchor.constraint(
                equalTo: directionLabel.bottomAnchor,
                constant: 8
            ),
            backgroundView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            backgroundView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            backgroundView.heightAnchor.constraint(equalToConstant: 150),
            
            infoStackView.topAnchor.constraint(
                equalTo: backgroundView.topAnchor,
                constant: 16
            ),
            infoStackView.leadingAnchor.constraint(
                equalTo: backgroundView.leadingAnchor,
                constant: 16
            ),
            
            likeImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 32),
            likeImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -22),
            
            likeButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -16),
            likeButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            likeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            likeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
