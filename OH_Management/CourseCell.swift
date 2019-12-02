//
//  CourseCell.swift
//  OH_Management
//
//  Created by CHOI Jongmin on 2/12/2019.
//  Copyright © 2019 CHOI Jongmin. All rights reserved.
//

import Foundation
import UIKit

class CourseCell : UICollectionViewCell {
    
    private var videoImageView = UIImageView()
    private var videoTitleLabel = UILabel()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        print("init")
        backgroundColor = .clear
        
        addSubview(videoImageView)
        addSubview(videoTitleLabel)

        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraint()
    }
    
    var first = {
        test = UIView()
    
        return test
    }()
    
    func set(course: CourseData){
        videoImageView.image = course.image
        videoTitleLabel.text = course.title
    }
    
    func configureImageView(){
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds      = true
        videoImageView.contentMode = .scaleAspectFit
    }
    
    func configureTitleLabel(){
        videoTitleLabel.numberOfLines             = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints(){
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                  = true
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: super.bounds.width/20).isActive = true
        let x = videoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.90)
            x.priority = .defaultHigh
        x.isActive = true
        videoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 4/5).isActive = true
    }
    
    func setTitleLabelConstraint(){
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLabel.adjustsFontForContentSizeCategory                                                         = false
        videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                 = true
        videoTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: bounds.width/10).isActive = true
        videoTitleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.90).isActive           = true
        videoTitleLabel.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    override func draw(_ rect: CGRect) {
        let xSpacing = 20
        let ySpacing = 10
        let frame = UIBezierPath(roundedRect: rect.insetBy(dx: CGFloat(xSpacing), dy: CGFloat(ySpacing)), cornerRadius: 10)
        frame.addClip()
        UIColor.white.setFill()
        frame.fill()
        
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        let shadowPath = UIBezierPath(roundedRect: rect.insetBy(dx: CGFloat(xSpacing), dy: CGFloat(ySpacing)), cornerRadius: 10)
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
