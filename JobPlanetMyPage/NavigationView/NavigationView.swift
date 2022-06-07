//
//  NavigationView.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/07.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

protocol NavigationDelegate: AnyObject {
    func tappedBack()
}

class NavigationView: DesignView {

    @IBOutlet weak var navigationTitle: UILabel!
    public var delegate: NavigationDelegate?
    
    public var title: String? {
        didSet {
            guard let data = title else { return }
            configure(title: data)
        }
    }
    
    override func loaded() {
        super.loaded()
    }
    
    @IBAction func tappedBackBtn(_ sender: UIButton) {
        delegate?.tappedBack()
    }
    
    private func configure(title: String) {
        self.navigationTitle.text = title
    }
    
}
