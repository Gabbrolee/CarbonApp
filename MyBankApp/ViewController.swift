//
//  ViewController.swift
//  MyBankApp
//
//  Created by user on 24/08/2021.
//

import UIKit

class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate,
                      UICollectionViewDelegateFlowLayout {
  
    lazy var collectionView:  UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .red
    cv.dataSource = self
    cv.delegate = self
    cv.isPagingEnabled = true
    return cv
    }()
   
   let cellId = "cellId"
   
  let pages: [Page] = {
    let firstPage = Page(title: "Go beyond banking", message: " Welcome to the future. Carbon is your passport to world class financial services, built for you", imageName: "page2")
    
    let secondPage = Page(title: "Stay on top of your finances Anytime. Anywhere", message: "Carbon makes financial services faster, cheaper and more convenient. You can access the app 24/7, wherever you are. ", imageName: "page3")
    
    let thirdPage = Page(title: "Trusted by millions", message: "With carbon\"s leading service already used by millions of people just like you , you\"re in a very good company.", imageName: "page1")
    return [firstPage, secondPage, thirdPage]
    
  }()
   
  private let createAccountButton: UIButton = {
      let button = UIButton()
      button.setTitle("Set up new account", for: .normal)
      button.backgroundColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
      button.setTitleColor(.white, for: .normal)
      button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
      return button
    }()
  
  let logoImageView : UIImageView = {
      let image =  UIImage(named: "Carbon")
      let imageView = UIImageView(image: image)
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(collectionView)
    collectionView.frame = view.frame
    layoutNextScreenButton()
    doBasicSetup()
    
    // use autolayout instead
    collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    
    collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    
    collectionView.register(OnboardingPage.self, forCellWithReuseIdentifier: cellId)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OnboardingPage
       //cell.backgroundColor = .white
    let page = pages[indexPath.item]
    cell.page = page
    return cell
  }
  // keeps the cell to the width and height of frame
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height:  view.frame.height)
  }
     @objc func didTapSignUpButton(){
     let nextController = SignUp()
     navigationController?.pushViewController(nextController, animated: true)
    }
      
  private func doBasicSetup() {
      view.backgroundColor = .systemPink
  }

   private func layoutNextScreenButton() {
      view.addSubview(createAccountButton)
      view.addSubview(logoImageView)

  NSLayoutConstraint.activate([
  createAccountButton.heightAnchor.constraint(equalToConstant: 52),
  createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
  createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
  createAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
])
    
      NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      logoImageView.heightAnchor.constraint(equalToConstant: 60),
      logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -100 ),
     
])

}
  override func viewWillLayoutSubviews() {
      createAccountButton.layer.cornerRadius = 8
  }
}

extension UIView {
  
  func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom:NSLayoutYAxisAnchor? = nil,  right: NSLayoutXAxisAnchor? = nil){
    
    anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
  }
  
  func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
    
    translatesAutoresizingMaskIntoConstraints = false

    if let top = top {
        topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
    }
    
    if let bottom = bottom {
        bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
    }
    
    if let left = left {
        leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
    }
    
    if let right = right {
        rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
    }
  }
  
//  func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
//      translatesAutoresizingMaskIntoConstraints = false
//
//      var anchors = [NSLayoutConstraint]()
//
//      if let top = top {
//        anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
//      }
//
//      if let left = left {
//        anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
//      }
//
//      if let bottom = bottom {
//        anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
//      }
//
//      if let right = right {
//        anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
//      }
//
//      if widthConstant > 0 {
//        anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
//      }
//
//      if heightConstant > 0 {
//        anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
//      }
//
//      anchors.forEach({$0.isActive = true})
//
//      return anchors
//    }
}

