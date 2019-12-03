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
    private var remainingTimeLabel = UILabel()
    private var numberOfStudentsInQueueLabel = UILabel()
    
    let containerView = UIView()
    let subViewImageAndTitle = UIView()
    let subViewDescription = UIView()
    let iconBar = UIStackView()
    
    let cornerRadius: CGFloat = 10.0
    let xSpacing: CGFloat = 20
    let ySpacing: CGFloat = 20
    
    func set(course: CourseData) {
        courseImageView.image = course.image
        
        courseTitleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 32)
        courseTitleLabel.textColor = .black
        courseTitleLabel.textAlignment = .center
        courseTitleLabel.text = course.title
        
        courseLocationLabel.font = UIFont(name: "AvenirNext-Medium", size: 20)
        courseLocationLabel.textColor = .darkGray
        courseLocationLabel.textAlignment = .center
        courseLocationLabel.text = course.location
        
        remainingTimeLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 40)
        remainingTimeLabel.textColor = .black
        remainingTimeLabel.textAlignment = .center
        remainingTimeLabel.text = String(course.numberOfStudentsInQueue!*course.avergeTimePerStudent!)
        
        numberOfStudentsInQueueLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 40)
        numberOfStudentsInQueueLabel.textColor = .black
        numberOfStudentsInQueueLabel.textAlignment = .center
        numberOfStudentsInQueueLabel.text = String(course.numberOfStudentsInQueue!)
        
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(containerView)
        configureContainerView()
        configureSubViewImageAndTitle()
        configuresSubViewDescription()
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
        
        configureCourseLocationLabel()
        setCourseLocationLabelConstraint()
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
        courseImageView.topAnchor.constraint(equalTo: subViewImageAndTitle.topAnchor, constant: ySpacing).isActive = true
    }
    
    func configureCourseTitleLabel() {
        courseTitleLabel.numberOfLines = 0
        courseTitleLabel.adjustsFontSizeToFitWidth = true
        subViewImageAndTitle.addSubview(courseTitleLabel)
    }
    
    func setCourseTitleLabelConstraint(){
       courseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
       courseTitleLabel.adjustsFontForContentSizeCategory = false
    
        courseTitleLabel.topAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: ySpacing/2).isActive = true
        courseTitleLabel.centerXAnchor.constraint(equalTo: subViewImageAndTitle.centerXAnchor).isActive = true
       }
    
    func configureCourseLocationLabel() {
        courseLocationLabel.numberOfLines = 0
        courseLocationLabel.adjustsFontSizeToFitWidth = true
        subViewImageAndTitle.addSubview(courseLocationLabel)
//        subViewDescription.addSubview(courseLocationLabel)
    }

    func setCourseLocationLabelConstraint() {
        courseLocationLabel.translatesAutoresizingMaskIntoConstraints = false
           courseLocationLabel.adjustsFontForContentSizeCategory = false
        
            courseLocationLabel.topAnchor.constraint(equalTo: courseTitleLabel.bottomAnchor).isActive = true
        courseLocationLabel.leadingAnchor.constraint(equalTo: courseTitleLabel.leadingAnchor).isActive = true
//            courseLocationLabel.centerXAnchor.constraint(equalTo: subViewImageAndTitle.centerXAnchor).isActive = true
    }
    
    func configuresSubViewDescription() {
        containerView.addSubview(subViewDescription)
        subViewDescription.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 6/10).isActive = true
        subViewDescription.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        subViewDescription.clipsToBounds = true
        subViewDescription.translatesAutoresizingMaskIntoConstraints = false
        subViewDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        configureHeader()
        setHeaderConstraint()
        
        subViewDescription.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: subViewDescription.leadingAnchor, constant: xSpacing/2).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.widthAnchor.constraint(equalTo: subViewDescription.widthAnchor, multiplier: 0.9).isActive = true
        
        configureRemainingTimeLabel()
        setRemainingTimeLabelConstraint()
            
        subViewDescription.addSubview(remainingTimeDescription)
        remainingTimeDescription.translatesAutoresizingMaskIntoConstraints = false
        remainingTimeDescription.bottomAnchor.constraint(equalTo: remainingTimeLabel.bottomAnchor, constant: -ySpacing/2).isActive = true
        remainingTimeDescription.leadingAnchor.constraint(equalTo: remainingTimeLabel.trailingAnchor, constant: xSpacing/2).isActive = true
        
        configureNumberOfStudentsInQueueLabel()
        setNumberOfStudentsInQueueLabelConstraint()
        
        subViewDescription.addSubview(numberOfStudentsInQueueDescription)
        numberOfStudentsInQueueDescription.translatesAutoresizingMaskIntoConstraints = false
        numberOfStudentsInQueueDescription.bottomAnchor.constraint(equalTo: numberOfStudentsInQueueLabel.bottomAnchor, constant: -ySpacing/2).isActive = true
        numberOfStudentsInQueueDescription.trailingAnchor.constraint(equalTo: remainingTimeDescription.trailingAnchor).isActive = true
        
        configureIconBar()
        setIconBarConstraint()
    }
    
    func configureIconBar() {
        iconBar.axis = .horizontal
        iconBar.alignment = .fill
        iconBar.distribution = .equalSpacing
        
        let mapStack = UIStackView()
        mapStack.axis = .vertical
        mapStack.alignment = .center
        mapStack.distribution = .fill
        
        let mapIcon = UIImageView(image: UIImage(systemName: "map"))
        let mapDescription = UILabel()
        mapDescription.text = "Map"
        mapDescription.textColor = .systemBlue
        mapStack.addArrangedSubview(mapIcon)
        mapStack.addArrangedSubview(mapDescription)
        
        let enrollStack = UIStackView()
        enrollStack.axis = .vertical
        enrollStack.alignment = .center
        enrollStack.distribution = .fill
        
        let enrollIcon = UIImageView(image: UIImage(systemName: "pencil.circle"))
        let enrollDescription = UILabel()
        enrollDescription.text = "Enroll"
        enrollDescription.textColor = .systemBlue
        enrollStack.addArrangedSubview(enrollIcon)
        enrollStack.addArrangedSubview(enrollDescription)
        
        let alertStack = UIStackView()
        alertStack.axis = .vertical
        alertStack.alignment = .center
        alertStack.distribution = .fill
        
        let alertIcon = UIImageView(image: UIImage(systemName: "bell"))
        let alertDescription = UILabel()
        alertDescription.textColor = .systemBlue
        alertDescription.text = "Alert"
        alertStack.addArrangedSubview(alertIcon)
        alertStack.addArrangedSubview(alertDescription)
        
        iconBar.addArrangedSubview(mapStack)
        iconBar.addArrangedSubview(enrollStack)
        iconBar.addArrangedSubview(alertStack)
        
        subViewDescription.addSubview(iconBar)
    }
    
    func setIconBarConstraint() {
        iconBar.translatesAutoresizingMaskIntoConstraints = false
//        iconBar.bottomAnchor.constraint(equalTo: subViewDescription.bottomAnchor, constant: -30).isActive = true
        iconBar.bottomAnchor.constraint(equalTo: courseLocationLabel.bottomAnchor).isActive = true
        iconBar.topAnchor.constraint(equalTo: subViewDescription.topAnchor, constant: frame.height * 0.65).isActive = true
        iconBar.centerXAnchor.constraint(equalTo: subViewDescription.centerXAnchor).isActive = true
        iconBar.widthAnchor.constraint(equalTo: subViewDescription.widthAnchor, multiplier: 0.85).isActive = true
    }
    
    let header = UILabel()
    
    func configureHeader() {
        header.font = UIFont(name: "AvenirNext-Medium", size: 20)
        header.textColor = .darkGray
        header.textAlignment = .center
        header.text = "Current Status"
        
        subViewDescription.addSubview(header)
    }
    
    func setHeaderConstraint() {
        header.translatesAutoresizingMaskIntoConstraints = false
        header.leadingAnchor.constraint(equalTo: subViewDescription.leadingAnchor, constant: xSpacing/2).isActive = true
        header.topAnchor.constraint(equalTo: subViewDescription.topAnchor, constant: ySpacing).isActive = true
    }
    
    let separatorView: UIView = {
       let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    func configureRemainingTimeLabel() {
        remainingTimeLabel.numberOfLines = 0
        remainingTimeLabel.adjustsFontSizeToFitWidth = true
        subViewDescription.addSubview(remainingTimeLabel)
    }
    
    func setRemainingTimeLabelConstraint() {
        remainingTimeLabel.translatesAutoresizingMaskIntoConstraints = false
           remainingTimeLabel.adjustsFontForContentSizeCategory = false
        
            remainingTimeLabel.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        remainingTimeLabel.leadingAnchor.constraint(equalTo: subViewDescription.leadingAnchor, constant: xSpacing/2).isActive = true
    }
    
    let remainingTimeDescription: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "AvenirNext-Medium", size: 15)
        view.textColor = .darkGray
        view.textAlignment = .left
        view.text = "minutes left"
        return view
    }()
    
    func configureNumberOfStudentsInQueueLabel() {
        numberOfStudentsInQueueLabel.numberOfLines = 0
        numberOfStudentsInQueueLabel.adjustsFontSizeToFitWidth = true
        subViewDescription.addSubview(numberOfStudentsInQueueLabel)
    }
    
    func setNumberOfStudentsInQueueLabelConstraint() {
        numberOfStudentsInQueueLabel.translatesAutoresizingMaskIntoConstraints = false
           numberOfStudentsInQueueLabel.adjustsFontForContentSizeCategory = false
        
            numberOfStudentsInQueueLabel.topAnchor.constraint(equalTo: remainingTimeLabel.bottomAnchor).isActive = true
        numberOfStudentsInQueueLabel.leadingAnchor.constraint(equalTo: subViewDescription.leadingAnchor, constant: xSpacing/2).isActive = true
    }
    
    let numberOfStudentsInQueueDescription: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "AvenirNext-Medium", size: 15)
        view.textColor = .darkGray
        view.textAlignment = .left
        view.text = "students left"
        return view
    }()
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
