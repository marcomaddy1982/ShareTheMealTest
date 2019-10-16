//
//  CampaignsViewController.swift
//  ShareTheMealTest
//
//  Created by Marco Maddalena on 14.10.19.
//  Copyright © 2019 ShareTheMeal. All rights reserved.
//

import UIKit
import Reusable

protocol CampaignsViewProtocol: class {
    func refresh(with viewModel: CampaignsViewModel)
}

class CampaignsViewController: UIViewController {

    @IBOutlet private var errorView: ErrorView!
    @IBOutlet private var loadingView: LoadingView!
    @IBOutlet private var collectionView: UICollectionView!

    var presenter: CampaignsPresenterProtocol!

    private var campaigns: [CampaignCellViewModel] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Campaigns"
        configureCollectionView()
        presenter.viewDidLoad()
    }

    // MARK: Private Methods

    private func configureCollectionView() {
        collectionView.register(cellType: CampaignCell.self)
    }

    // MARK: IBAction Methods

    @IBAction private func errorViewTouchUpInside(_ sender: Any) {
        presenter?.didTapRetry()
    }
}

// MARK: CollectionViewDelegate - CollectionViewDataSource

extension CampaignsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return campaigns.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CampaignCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CampaignCell",
                                                                    for: indexPath) as! CampaignCell
        cell.delegate = self
        cell.configure(with: campaigns[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = UIScreen.main.bounds.size.height
        let width: CGFloat = UIScreen.main.bounds.size.width
        return CGSize(width: width, height: height)
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension CampaignsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CampaignsViewController: CampaignCellDelegate {
    @objc
    func donate() {
        presenter.didTapDonate()
    }

    @objc
    func refresh() {
        presenter.didTapRefresh()
    }
}

// MARK: CampaignsViewProtocol

extension CampaignsViewController: CampaignsViewProtocol {
    func refresh(with viewModel: CampaignsViewModel) {
        DispatchQueue.main.async {
            if case .data(let campaigns) = viewModel {
                self.campaigns = campaigns
                self.collectionView.reloadData()
            }
            self.errorView.isHidden = !viewModel.isError
            self.loadingView.isHidden = !viewModel.isLoading
        }
    }
}
