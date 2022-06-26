//
//  ViewController.swift
//  ScrollViewWillEndDragging
//
//  Created by TheLightLove on 04/06/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slideCollectionView: UICollectionView!
    let arrImage = ["1","2","3","4","5"]
    
    var itemWidth = CGFloat(0)
    let collectionMargin = CGFloat(20)
    let itemSpacing = CGFloat(10)
    var pageNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateCollectionView()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setDelegateCollectionView() {
        slideCollectionView.delegate = self
        slideCollectionView.dataSource = self
        slideCollectionView.register(UINib(nibName: "SlideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SlideCollectionViewCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = slideCollectionView.dequeueReusableCell(withReuseIdentifier: "SlideCollectionViewCell", for: indexPath) as! SlideCollectionViewCell
        cell.setData(arrImage[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        itemWidth =  UIScreen.main.bounds.width - collectionMargin * 2.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemWidth, height: slideCollectionView.frame.size.height)
        
        layout.headerReferenceSize = CGSize(width: collectionMargin, height: 0)
        layout.footerReferenceSize = CGSize(width: collectionMargin, height: 0)
        
        layout.minimumLineSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        slideCollectionView!.collectionViewLayout = layout
        slideCollectionView?.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = Float(itemWidth + itemSpacing)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(slideCollectionView!.contentSize.width)
        var newPage = pageNumber
        
        if velocity.x == 0 {
            newPage = Int(floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0)
        } else {
            newPage = Int(velocity.x > 0 ? newPage + 1 : newPage - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > Int(contentWidth / pageWidth)) {
                newPage = Int(ceil(contentWidth / pageWidth) - 1.0)
            }
        }
        
        pageNumber = newPage
        let point = CGPoint (x: CGFloat(Float(newPage) * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
    }
}
