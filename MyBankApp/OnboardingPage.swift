//
//  OnboardingPage.swift
//  MyBankApp
//
//  Created by user on 24/08/2021.
//

import UIKit
import Lottie


class OnboardingPage: UICollectionViewCell {
  
  var animation: AnimationView!
  
  func displayAnimation() {
    
    animation = .init(name: "bank")
    animation.frame = contentView.bounds
    animation.contentMode = .scaleAspectFit
    animation.loopMode = .repeatBackwards(3)
    animation.animationSpeed = 0.7
    
    addSubview(animation)
    
    animation.play()
  }
  
  var page: Page? {
    didSet {
      
      guard let page = page else {
        return
      }
      
      // imageView.image = UIImage(named: page.imageName)
      
      let color = UIColor(white: 0.2, alpha: 1)
      
      let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color])
      
      attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize:14), NSAttributedString.Key.foregroundColor: color]))
      
      textView.text = page.title + "\n\n" + page.message
      
      textView.attributedText = attributedText
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .center
      
      let length = attributedText.string.count
      attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
      
      textView.attributedText = attributedText
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    displayAnimation()
  }
//
//  let imageView: UIImageView = {
//    let iv = UIImageView()
//    iv.contentMode = .scaleAspectFill
//    iv.backgroundColor = .white
//    iv.image = UIImage(named: "page")
//    iv.clipsToBounds = true
//    return iv
//  }()
  
  let textView: UITextView = {
    let tv = UITextView()
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.text = "Sample Text for Now"
    tv.isEditable = false
    tv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    return tv
  }()
  
  // Immediately Invoked Function Expression
  func setupViews() {
    backgroundColor = .white
    // addSubview(imageView)
    addSubview(textView)
    displayAnimation()
    
    
    animation.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    
    textView.anchorWithConstantsToTop(top: animation.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 50, leftConstant: 30, bottomConstant: 30, rightConstant: 30)
    
    textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    //])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
