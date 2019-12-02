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
        var blankCourse = CourseData()
        blankCourse.title = "Test"
        blankCourse.image = Images.CIS120
        return [blankCourse]
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
