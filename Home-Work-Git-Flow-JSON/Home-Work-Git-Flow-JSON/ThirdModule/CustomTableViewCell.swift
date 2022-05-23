//
//  CustomTableViewCell.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 17.05.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private lazy var labelName: UILabel = {
        let lable = UILabel()
        lable.text = "Тема :"
        return lable
    }()
    
    private lazy var labelEmails: UILabel = {
        let lable = UILabel()
        lable.text = "Почта :"
        return lable
    }()
    
    private lazy var labelMessages: UILabel = {
        let lable = UILabel()
        lable.text = "Сообщение :"
        return lable
    }()
    
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
        lable.numberOfLines = 0
        return lable
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.addArrangedSubview(labelName)
        stackView.addArrangedSubview(labelUserName)
        stackView.addArrangedSubview(labelEmails)
        stackView.addArrangedSubview(labelEmail)
        stackView.addArrangedSubview(labelMessages)
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

    private func configure(_ viewModel: CustomCellModel) {
        labelUserName.text = viewModel.labelUserName
        labelEmail.text = viewModel.labelEmail
        labelMessage.text = viewModel.labelMessage
    }

    private func setupConstraints () {
        stackView.snp.makeConstraints { (make)-> Void in
            make.leading.equalToSuperview().offset(18.0)
            make.top.equalToSuperview().offset(0.0)
            make.bottom.equalToSuperview().offset(0.0)
            make.trailing.equalToSuperview().offset(-18.0)
        }
        labelName.snp.makeConstraints { (make)-> Void in
            make.leading.equalTo(stackView.snp.leading).offset(0.0)
        }
        labelUserName.snp.makeConstraints { (make)-> Void in
            make.leading.equalTo(labelName.snp.leading).offset(15.0)
            make.top.equalTo(labelName.snp.bottom).offset(0.0)
        }
        labelEmails.snp.makeConstraints { (make)-> Void in
            make.leading.equalTo(labelName.snp.leading).offset(0.0)
            make.top.equalTo(labelUserName.snp.bottom).offset(0.0)
        }
        labelEmail.snp.makeConstraints { (make)-> Void in
            make.leading.equalTo(labelUserName.snp.leading).offset(0.0)
            make.top.equalTo(labelEmails.snp.bottom).offset(0.0)
        }
        labelMessages.snp.makeConstraints { (make)-> Void in
            make.leading.equalTo(labelName.snp.leading).offset(0.0)
            make.top.equalTo(labelEmail.snp.bottom).offset(0.0)
        }
        labelMessage.snp.makeConstraints { (make)-> Void in
            make.leading.equalTo(labelUserName.snp.leading).offset(0.0)
            make.top.equalTo(labelMessages.snp.bottom).offset(0.0)
        }
    }
}
