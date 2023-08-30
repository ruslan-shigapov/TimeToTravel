//
//  FlightCell.swift
//  TimeToTravel
//
//  Created by Руслан Шигапов on 29.08.2023.
//

import UIKit

final class FlightCell: UITableViewCell {
    
    // MARK: - Private Properties
    private lazy var flightInfoStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                startDateLabel,
                departureStackView,
                endDateLabel,
                arrivalStackView
            ]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var departureStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [startLocationLabel, departureImageView]
        )
        return stackView
    }()
    
    private lazy var startLocationLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var departureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane.departure")
        imageView.tintColor = .label
        return imageView
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var arrivalStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [arrivalImageView, endLocationLabel]
        )
        return stackView
    }()
    
    private lazy var arrivalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane.arrival")
        imageView.tintColor = .label
        return imageView
    }()
    
    private lazy var endLocationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var directionStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [startCityLabel, endCityLabel]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var startCityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var endCityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [priceLabel, likeImageView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "hand.thumbsup")
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    // MARK: - Public Properties
    var viewModel: FlightCellViewModelProtocol! {
        didSet {
            startDateLabel.text = viewModel.startDate
            startLocationLabel.text = viewModel.startLocationCode
            endDateLabel.text = viewModel.endDate
            endLocationLabel.text = viewModel.endLocationCode
            startCityLabel.text = viewModel.startCity
            endCityLabel.text = viewModel.endCity
            priceLabel.text = viewModel.price
        }
    }
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(flightInfoStackView)
        addSubview(priceStackView)
        addSubview(directionStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            flightInfoStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16
            ),
            flightInfoStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            flightInfoStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            
            directionStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            directionStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            priceStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            
            likeImageView.widthAnchor.constraint(equalToConstant: 30),
            likeImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
