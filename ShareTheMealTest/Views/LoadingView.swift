//
//  LoadingView.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import UIKit

@IBDesignable
public final class LoadingView: UIView {
    @IBOutlet public var containerView: UIView!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        embedView(ofNibNamed: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
    }
}
