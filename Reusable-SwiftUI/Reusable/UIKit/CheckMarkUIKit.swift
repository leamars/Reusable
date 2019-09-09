//
//  CheckMarkUIKit.swift
//  Reusable
//
//  Created by Lea Marolt Sonnenschein on 02/09/2019.
//  Copyright © 2019 elemes. All rights reserved.
//

import UIKit

protocol CheckmarkBoxViewDelegate: class {
  func didToggle(to state: Bool)
}

class CheckmarkBox: UIView {
  
  private var isOn: Bool
  weak var delegate: CheckmarkBoxViewDelegate?
  
  init(isOn: Bool) {
    self.isOn = isOn
    super.init(frame: .zero)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    setupConstraints()
  }
  
  private func addTap() {
    let tapRec = UITapGestureRecognizer(target: self, action: #selector(didTap))
    addGestureRecognizer(tapRec)
  }
  
  @objc private func didTap()  {
    isOn.toggle()
    updateFor(state: isOn)
    delegate?.didToggle(to: isOn)
  }
  
  private func updateFor(state: Bool) {
    
  }
  private func setupConstraints() {
    
  }
}
