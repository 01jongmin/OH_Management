//
//  ViewController.swift
//  OH_Management
//
//  Created by CHOI Jongmin on 22/11/2019.
//  Copyright © 2019 CHOI Jongmin. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var courses: [CourseData] = {
        var course1 = CourseData()
        course1.title = "CIS 120"
        course1.image = Images.CIS120
        course1.location = "Towne 211"
        course1.avergeTimePerStudent = 5
        course1.numberOfStudentsInQueue = 20
        
        var course2 = CourseData()
        course2.title = "CIS 160"
        course2.image = Images.CIS160
        course2.location = "Skir 114"
        course2.avergeTimePerStudent = 10
        course2.numberOfStudentsInQueue = 14
        
        return [course1, course2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        navigationItem.title = "Home"
        collectionView.backgroundColor = UIColor.white
        
        collectionView?.register(CourseCell.self, forCellWithReuseIdentifier: "cellID")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CourseCell
        
        cell.set(course: courses[indexPath.item])
        
        return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
