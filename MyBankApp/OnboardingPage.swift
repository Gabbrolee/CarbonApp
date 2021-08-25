//
//  OnboardingPage.swift
//  MyBankApp
//
//  Created by user on 24/08/2021.
//

import UIKit

class OnboardingPage: UICollectionViewCell {
  var page: Page? {
    didSet {
      
      guard let page = page else {
        return
      }
      
      imageView.image = UIImage(named: page.imageName)
      
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
  }
   
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.backgroundColor = .yellow
    iv.image = UIImage(named: "page")
    iv.clipsToBounds = true
    return iv
  }()
   
  
  
  let textView: UITextView = {
    let tv = UITextView()
    tv.text = "Sample Text for Now"
    tv.isEditable = false
    tv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    return tv
    
  }()
 
  // Immediately Invoked Function Expression
  
  let lineSeparatorView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(white: 0.9, alpha: 1)
    return view
  }()
    
  
  func setupViews() {
    backgroundColor = .white
    
    addSubview(imageView)
    addSubview(textView)
    //addSubview(lineSeparatorView)
    
    //addSubview(b)

    imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
    //textView.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    
    textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
    
    textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    
//    lineSeparatorView.anchorToTop(top: nil, left: leftAnchor , bottom: textView.topAnchor, right: rightAnchor)
//    lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
  }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}