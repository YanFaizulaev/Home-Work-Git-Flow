//
//  FirstViewControllerCell.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import UIKit

class FirstViewControllerCell: UITableViewCell {
    
    private lazy var imageService: UIImageView = {
        let imageView = UIImageView ()
        return imageView
    }()
    
    private lazy var textHeader: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var textLabelIn: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                super.init(style: style, reuseIdentifier: reuseIdentifier)
    
                addSubview(imageService)
                addSubview(textHeader)
                addSubview(textLabelIn)
            }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
            private func setContents (viewModelCell: ModelCell ) {
                imageService.image = viewModelCell.imageService
                textHeader.text = viewModelCell.textHeader
                textLabelIn.text = viewModelCell.textLabelIn
            }
}
