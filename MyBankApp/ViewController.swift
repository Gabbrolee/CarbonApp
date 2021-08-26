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
    cv.backgroundColor = .white
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
     
    private let skipButton: UIButton = {
      let button = UIButton()
      button.setTitle("Skip", for: .normal)
      button.setTitleColor(UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00), for: .normal)
      button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
      button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
      return button
    }()

    override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(collectionView)
    collectionView.frame = view.frame
    layoutNextScreenButton()
    doBasicSetup()
    
    
    // use autolayout instead
      collectionView.anchorToTop(top: logoImageView.bottomAnchor, left: view.leftAnchor,
                                 bottom: createAccountButton.topAnchor, right: view.rightAnchor)

    collectionView.register(OnboardingPage.self, forCellWithReuseIdentifier: cellId)
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OnboardingPage
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
    
    @objc func didTapNextButton(_ sender: UIButton) {
      
      let nextViewController = SignUp()
      navigationController?.pushViewController(nextViewController, animated: true)
    }
    @objc func didTapLoginButton(_ sender: UIButton) {
      
      let nextViewController = Login()
      navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
      
     private func doBasicSetup() {
      view.backgroundColor = .white
    }

     private func layoutNextScreenButton() {
      view.addSubview(createAccountButton)
      view.addSubview(logoImageView)
      view.addSubview(skipButton)
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapNextButton))
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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
          
      let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
      
      if pageNumber == 0 {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapNextButton))
      } else {
     self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign in", style: .plain, target: self, action:        #selector(didTapLoginButton))
      }
    }
     }

    
