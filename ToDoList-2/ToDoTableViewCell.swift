//
//  ToDoTableViewCell.swift
//  ToDoList-2
//
//  Created by Jungjin Park on 2024-05-26.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    lazy var priorityLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCustomDetailTextLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCustomDetailTextLabel()
    }
    
    func setupCustomDetailTextLabel() {
        addSubview(titleLabel)
        addSubview(priorityLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priorityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let marginsGuide = self.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: marginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: marginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: marginsGuide.trailingAnchor, constant: -30),
            priorityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priorityLabel.leadingAnchor.constraint(equalTo: marginsGuide.leadingAnchor),
            priorityLabel.trailingAnchor.constraint(equalTo: marginsGuide.trailingAnchor, constant: -30),
            priorityLabel.bottomAnchor.constraint(equalTo: marginsGuide.bottomAnchor)
        ])
    }
}
