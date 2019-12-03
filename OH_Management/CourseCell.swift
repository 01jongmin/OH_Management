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
    
    private var courseImageView = UIImageView()
    private var courseTitleLabel = UILabel()
    private var courseLocationLabel = UILabel()
    
    let containerView = UIView()
    let subViewImageAndTitle = UIView()
    let subViewDescription = UIView()
    
    let cornerRadius: CGFloat = 10.0
    let xSpacing: CGFloat = 20
    let ySpacing: CGFloat = 10
    
    func set(course: CourseData) {
        courseImageView.image = course.image
        courseTitleLabel.text = course.title
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(containerView)
        configureContainerView()
        configureSubViewImageAndTitle()
    }
    
    func configureContainerView() {
        // set the shadow of the view's layer
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4.0
          
        // set the cornerRadius of the containerView's layer
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.masksToBounds = true
        containerView.clipsToBounds = true
        containerView.backgroundColor = .white
        
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowOpacity = 0.5
        let shadowPath = UIBezierPath(roundedRect: bounds.insetBy(dx: CGFloat(xSpacing), dy: CGFloat(ySpacing)), cornerRadius: 10)
        containerView.layer.shadowPath = shadowPath.cgPath

        // add constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false

        // pin the containerView to the edges to the view
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xSpacing).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xSpacing).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: ySpacing).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -ySpacing).isActive = true
    }
    
    func configureSubViewImageAndTitle() {
        containerView.addSubview(subViewImageAndTitle)
        subViewImageAndTitle.translatesAutoresizingMaskIntoConstraints = false
        
        subViewImageAndTitle.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 4/10).isActive = true
        subViewImageAndTitle.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        subViewImageAndTitle.clipsToBounds = true
        subViewImageAndTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        configureCourseImageView()
        setCourseImageViewConstraints()
        configureCourseTitleLabel()
        setCourseTitleLabelConstraint()
    }
    
    func configureCourseImageView(){
        courseImageView.layer.cornerRadius = 10
        courseImageView.clipsToBounds      = true
        courseImageView.contentMode        = .scaleAspectFit
        subViewImageAndTitle.addSubview(courseImageView)
    }
    
    func setCourseImageViewConstraints(){
        courseImageView.translatesAutoresizingMaskIntoConstraints = false
        courseImageView.centerXAnchor.constraint(equalTo: subViewImageAndTitle.centerXAnchor).isActive = true
        courseImageView.heightAnchor.constraint(equalTo: subViewImageAndTitle.heightAnchor, multiplier: 0.50).isActive = true
        courseImageView.widthAnchor.constraint(equalTo: subViewImageAndTitle.widthAnchor, multiplier: 4/5).isActive = true
        courseImageView.topAnchor.constraint(equalTo: subViewImageAndTitle.topAnchor, constant: xSpacing).isActive = true
    }
    
    func configureCourseTitleLabel() {
        courseTitleLabel.numberOfLines = 0
        courseTitleLabel.adjustsFontSizeToFitWidth = true
        subViewImageAndTitle.addSubview(courseTitleLabel)
    }
    
    func setCourseTitleLabelConstraint(){
       courseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
       courseTitleLabel.adjustsFontForContentSizeCategory = false
        
//        courseTitleLabel.centerYAnchor.constraint(equalTo: subViewImageAndTitle.centerYAnchor, constant: 0).isActive = true
    
        courseTitleLabel.topAnchor.constraint(equalTo: courseImageView.bottomAnchor).isActive = true
        courseTitleLabel.centerXAnchor.constraint(equalTo: subViewImageAndTitle.centerXAnchor).isActive = true
        
//        courseTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//       courseTitleLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
//        courseTitleLabel.topAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: 50).isActive = true
    
    
       }
    


//    func configuresSubViewDescription() {
//        secondHalf.backgroundColor = .blue
//        subViewDescription.widthAnchor.constraint(equalTo: super.widthAnchor, multiplier: 6/10).isActive = true
//        subViewDescription.heightAnchor.constraint(equalTo: super.heightAnchor).isActive = true
//        subViewDescription.clipsToBounds = true
//        subViewDescription.translatesAutoresizingMaskIntoConstraints = false
//        subViewDescription.trailingAnchor.constraint(equalTo: super.trailingAnchor).isActive = true
//    }

//    func configureTitleLabel(){
//        videoTitleLabel.numberOfLines             = 0
//        videoTitleLabel.adjustsFontSizeToFitWidth = true
//    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
