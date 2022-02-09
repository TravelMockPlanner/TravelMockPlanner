//
//  RestaurantViewCell.swift
//  TravelManagePlanner
//
//  Created by YoonDaeSung on 2022/02/08.
//

import UIKit

class RestaurantViewCell: UITableViewCell {

    var cellDelegate: ContentsMainTextDelegate?
        
        lazy var restaurantImgButton: UIButton = {
            let button = UIButton()
    //        button.contentMode = .scaleToFill
            button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
            button.imageView?.layer.cornerRadius = 10
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 4)
            button.layer.shadowRadius = 5
            button.layer.shadowOpacity = 0.3
            
            return button
        }()
        
        lazy var restaurantTitle: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 22)
            label.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
            
            return label
        }()
        
        lazy var restaurantSubTitle: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15)
            label.textAlignment = .center
            label.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
            
            return label
        }()
        
        lazy var restaurantSelectButton: UIButton = {
           let  button = UIButton()
            button.setTitle("선택", for: .normal)
            button.setTitleColor(UIColor(red: 209/255, green: 120/255, blue: 168/255, alpha: 1), for: .normal)
            button.setTitleColor(UIColor(red: 209/255, green: 120/255, blue: 168/255, alpha: 0.6), for: .highlighted)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
            button.backgroundColor = .clear
            
            return button
        }()
        
        
        @objc
        func restaurantSelectAction() {
            cellDelegate?.categoryButtonTapped()
        }
        
        lazy var restaurantTitleStack: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [restaurantTitle, restaurantSubTitle])
            stackView.axis = .vertical
            stackView.spacing = 2
            
            return stackView
        }()
        
        lazy var restaurantAllTitleStack: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [restaurantTitleStack, restaurantSelectButton])
            stackView.axis = .horizontal
            stackView.spacing = 10
            
            return stackView
        }()
        
        // 함수생성후 뷰컨에서 호출 이미지를 뷰컨에서 넘겨줌
        func cellLoadImage(_ imgData: String) {
            
            restaurantImgButton.setImage(UIImage(named: imgData), for: .normal)
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUpView()
            setLayout()
            
            self.restaurantSelectButton.addTarget(self, action: #selector(restaurantSelectAction), for: .touchUpInside)
            
            
        }
        
        func setUpView() {
            contentView.addSubview(restaurantImgButton)
            contentView.addSubview(restaurantAllTitleStack)
            
        }
        
        func setLayout() {
    //        accomoImgButton.frame = CGRect.init(x: 0, y: 0, widthㅇ: contentView.frame.width, height: 160)
            restaurantImgButton.frame = CGRect.init(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height / 0.28)
            
            restaurantAllTitleStack.snp.makeConstraints {
                $0.top.equalTo(restaurantImgButton.snp.bottom).multipliedBy(1.0)
                $0.leading.equalToSuperview().offset(0)
                $0.trailing.equalToSuperview().offset(0)
            }
            
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
    }