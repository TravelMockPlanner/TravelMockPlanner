//
//  ThemeViewCell.swift
//  TravelManagerPlanner
//
//  Created by YoonDaeSung on 2022/01/02.
//

import UIKit
import SnapKit

class ThemeViewCell: UICollectionViewCell {
    
    lazy var imgButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    lazy var imgLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var imgStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imgButton, imgLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    // 함수생성후 뷰컨에서 호출 이미지를 뷰컨에서 넘겨줌
    func cellLoadImage(_ imgData: String) {
        
        imgButton.setImage(UIImage(named: imgData), for: .normal)
        imgButton.imageView?.layer.cornerRadius = 15
        imgButton.layer.shadowColor = UIColor.black.cgColor
        imgButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        imgButton.layer.shadowRadius = 5
        imgButton.layer.shadowOpacity = 0.3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setLayout()
        
    }
    
    func setUpView() {
        addSubview(imgStack)
        //        addSubview(imgLabel)
    }
    
    func setLayout() {
        imgStack.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        
        //        imgLabel.frame = CGRect(x: 1, y: 1, width: contentView.frame.width, height: contentView.frame.height)
        
        //        imgLabel.snp.makeConstraints {
        //            $0.top.equalTo(imgButton.snp.bottom).multipliedBy(1)
        //            $0.leading.equalToSuperview().offset(24)
        //            $0.right.equalToSuperview().offset(-24)
        //        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
