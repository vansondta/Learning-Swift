//
//  ViewController.swift
//  SlideScrollView
//
//  Created by TheLightLove on 04/06/2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    let arrImage = ["1","2","3","4","5"]
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        configureScrollView()
        view.addSubview(pageControl)
        pageControl.numberOfPages = arrImage.count
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updatePageView), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.numberOfPages = arrImage.count
        pageControl.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0).isActive = true
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    @objc private func updatePageView() {
        let index = pageControl.currentPage
        if index == 4 {
            pageControl.currentPage = 0
        } else {
            pageControl.currentPage = index + 1
        }
        
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    @objc private func pageControlDidChange(_ sender:UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.width, y: 0), animated: true)
    }

    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width*CGFloat(arrImage.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        for x in 0..<5 {
            let imageName = arrImage[x]
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: CGFloat(x) * view.frame.width, y: 0, width: view.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleToFill
            scrollView.addSubview(imageView)
        }
    }

}

extension ViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(Float(scrollView.contentOffset.x)/Float(scrollView.frame.width)))
    }
}

