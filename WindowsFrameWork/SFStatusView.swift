//
//  SFStatusView.swift
//  WindowsFrameWork
//
//  Created by Salma on 1/2/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit

public class SFStatusView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let nibName = "SFStatusView"
    var contentView: UIView!
    // so that the view closes after a certain time
    var timer: Timer?
    
    
    // MARK: Set Up View
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        headlineLabel.text = ""
        descriptionLabel.text = ""
    }
    
    // func to update view
    public func set(image: UIImage) {
        self.imageView.image = image
    }
    public func set(headline text: String) {
        self.headlineLabel.text = text
    }
    public func set(description text: String) {
        self.descriptionLabel.text = text
    }
    
    public override func didMoveToSuperview() {
        // add timer to remove view
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(3.0), target: self, selector: #selector(self.removeSelf), userInfo: nil, repeats: false)
    }
    @objc private func removeSelf() {
        self.removeFromSuperview()
    }
    
    // Round corners. For visual
    public override func layoutSubviews() {
        self.layoutIfNeeded()
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
    }
    
//    // Animation
//    public override func didMoveToSuperView() {
//        // Fade-in movtion when added to superView
//        // Timer to remove the view
//        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//        UIView.animate(withDuration: 0.15, animations: {
//            self.contentView.alpha = 1.0
//            self.contentView.transform = CGAffineTransform.identity
//        }) { _ in
//            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(3.0), target: self, selector: #selector(self.removeSelf), userInfo: nil, repeats: false)
//        }
//    }
//    @objc private func removeSelf() {
//        // Animate removal of view
//        UIView.animate(
//            withDuration: 0.15,
//            animations: {
//            self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            self.contentView.alpha = 0.0
//        }) { _ in
//            self.removeFromSuperview()
//        }
//    }
}
