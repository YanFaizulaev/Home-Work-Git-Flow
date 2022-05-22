//
//  CustomTableViewCell.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 17.05.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var labelUserName: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    lazy var labelEmail: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    lazy var labelMessage: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.addArrangedSubview(labelUserName)
        stackView.addArrangedSubview(labelEmail)
        stackView.addArrangedSubview(labelMessage)
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        setupConstraints()
}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}

    func configure(_ viewModel: CustomCellModel) {
        labelUserName.text = viewModel.labelUserName
        labelEmail.text = viewModel.labelEmail
        labelMessage.text = viewModel.labelMessage
    }

    private func setupConstraints () {
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        }
    
    
    
    
    
//
//    let imgUser = UIImageView()
//    let labelUserName = UILabel()
//    let labelEmail = UILabel()
//    let labelMessage = UILabel()
//
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        imgUser.backgroundColor = UIColor.green
//
//        imgUser.translatesAutoresizingMaskIntoConstraints = false
//        labelUserName.translatesAutoresizingMaskIntoConstraints = false
//        labelEmail.translatesAutoresizingMaskIntoConstraints = false
//        labelMessage.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(imgUser)
//        contentView.addSubview(labelUserName)
//        contentView.addSubview(labelEmail)
//        contentView.addSubview(labelMessage)
//
//        let viewsDict = [
//            "image": imgUser,
//            "username": labelUserName,
//            "labTime": labelEmail,
//            "message": labelMessage
//        ]
//
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(10)]", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[labTime]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[username]-[message]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[username]-[image(10)]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[message]-[labTime]-|", options: [], metrics: nil, views: viewsDict))
//    }
}
