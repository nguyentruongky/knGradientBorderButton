//
//  ViewController.swift
//  GradientBorderButton
//
//  Created by Ky Nguyen on 4/13/17.
//  Copyright © 2017 Ky Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let gradientView = knGradientBorderButton()
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        gradientView.square(edge: 100)
        gradientView.center(toView: view)
        
        gradientView.backgroundColor = .white
        gradientView.createBorder(1)
        gradientView.createRoundCorner(50)
        gradientView.setTitle("Hi there", for: .normal)
        gradientView.setTitleColor(.blue, for: .normal)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

