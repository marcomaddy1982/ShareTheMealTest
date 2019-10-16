//
//  CampaignCell.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 15.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import UIKit
import Reusable
import Nuke
import FBSDKLoginKit

protocol CampaignCellDelegate: class {
    func donate()
    func refresh()
}

class CampaignCell: UICollectionViewCell {

    @IBOutlet private var imageCampaign: UIImageView!
    @IBOutlet private var labelHtmlText: UILabel!
    @IBOutlet private var stackButtons: UIStackView!

    weak var delegate : CampaignCellDelegate?

    private var campaign: Campaign?

    override func prepareForReuse() {
        super.prepareForReuse()
        imageCampaign.image = nil
        labelHtmlText.text = nil
        stackButtons.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }

    // MARK: Public Methods

    func configure(with campaign: CampaignCellViewModel) {
        loadImage(with: campaign.imageUrl)
        labelHtmlText.attributedText = campaign.htmlText
        configureButtons(with: campaign.buttons)
    }

    // MARK: - Private Methods

    private func loadImage(with url: URL?) {
        if let imageUrl = url {
            let imageOptions = ImageLoadingOptions(placeholder: UIImage(named: "placeholderImage"),
                                                   transition: .fadeIn(duration: 0.33))
            Nuke.loadImage(with: imageUrl,
                           options: imageOptions,
                           into: imageCampaign)
        } else {
            imageCampaign.image = UIImage(named: "placeholderImage")
        }
    }

    private func configureButtons(with buttons: [Button]) {
        buttons.forEach { button in
            switch button.action {
                case "donate",
                     "refresh":
                configureSystemButton(with: button)
            case "facebook":
                configureFacebookButton()
            default:
                break
            }
        }
    }

    private func configureSystemButton(with button: Button) {
        let systemButton = UIButton(type: .system)
        systemButton.translatesAutoresizingMaskIntoConstraints = false
        stackButtons.addArrangedSubview(systemButton)
        stackButtons.addConstraints([
            systemButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        systemButton.setTitle(button.text, for: .normal)
        systemButton.addTarget(delegate, action: Selector(button.action), for: .touchUpInside)
    }

    private func configureFacebookButton() {
        let loginButton = FBLoginButton(type: .system)
        stackButtons.addArrangedSubview(loginButton)
    }
}

extension CampaignCell: NibReusable { }
