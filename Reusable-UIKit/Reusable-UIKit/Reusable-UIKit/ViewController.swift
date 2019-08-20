//
//  ViewController.swift
//  Reusable-UIKit
//
//  Created by Lea on 19/08/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import UIKit
import SnapKit

enum MainButtonType {
  case primary(withArrow: Bool)
  case secondary(withArrow: Bool)
  case destructive(withArrow: Bool)
  
  var color: UIColor {
    switch self {
    case .primary:
      return .appGreen
    case .secondary:
      return .appBlack
    case .destructive:
      return .copper
    }
  }
  
  // TODO: Hopefully Luke gives us a white Image, so we don't have to switch here at all
  var arrowImage: UIImage {
    switch self {
    case .primary, .secondary:
      return #imageLiteral(resourceName: "green")
    case .destructive:
      return #imageLiteral(resourceName: "red")
    }
  }
  
  var hasArrow: Bool {
    switch self {
    case .primary(let hasArrow),
         .destructive(let hasArrow),
         .secondary(let hasArrow):
      return hasArrow
    }
  }
}

class MainButton: UIButton {
  
  private var title: String
  private var type: MainButtonType
  
  init(title: String, type: MainButtonType) {
    self.title = title
    self.type = type
    super.init(frame: .zero)
    
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    backgroundColor = type.color
    
    layer.cornerRadius = 10
    
    titleLabel?.textColor = .white
    titleLabel?.font = UIFont.uiButtonLabel
    setTitle(title, for: .normal)
    setTitle(title, for: .disabled)
    setTitle(title, for: .focused)
    setTitle(title, for: .reserved)
    
    if type.hasArrow {
      let whiteView = UIView()
      addSubview(whiteView)
      
      whiteView.snp.makeConstraints { make in
        make.height.width.equalTo(24)
        make.trailing.bottom.equalToSuperview().offset(-10)
        make.top.equalToSuperview().offset(10)
      }
      
      whiteView.backgroundColor = .white
      whiteView.layer.cornerRadius = 9
      
      let imageView = UIImageView(image: type.arrowImage)
      imageView.contentMode = .scaleAspectFit
      whiteView.addSubview(imageView)
      
      imageView.snp.makeConstraints { make in
        make.center.equalToSuperview()
        make.size.lessThanOrEqualToSuperview()
      }
    }
  }
}

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let button = MainButton(title: "Sign In", type: .primary(withArrow: true))
    view.addSubview(button)
    button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    
    button.snp.makeConstraints { make in
      make.height.equalTo(44)
      make.center.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.8)
    }
  }

  @objc func signIn() {
    print("Sign me in...")
  }
}

