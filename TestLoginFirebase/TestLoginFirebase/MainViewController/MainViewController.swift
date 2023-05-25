//
//  ViewController.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 18/05/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var optionsButtonImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var firstCellIndicatorView: UIView!
    @IBOutlet weak var secondCellIndicatorView: UIView!
    @IBOutlet weak var thirdCellIndicatorView: UIView!
    @IBOutlet weak var fourthCellIndicatorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonOptionsAppearance()
        setupCollectionView()
        setupPageIndicator()
        updatePageIndicator(cellNumber: 0)
    }
    
    @IBAction func tappedSignInButton(_ sender: UIButton) {
        let vc: LoginViewController? = UIStoryboard(name: LoginViewController.identifier, bundle: nil).instantiateViewController(identifier: LoginViewController.identifier) {coder -> LoginViewController? in
            return LoginViewController(coder: coder, email: "")
        }
        present(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let vc: CheckEmailViewController? = UIStoryboard(name: CheckEmailViewController.identifier, bundle: nil).instantiateViewController(withIdentifier: CheckEmailViewController.identifier) as? CheckEmailViewController
        present(vc ?? UIViewController(), animated: true)
    }
    
    private func setupButtonOptionsAppearance() {
        optionsButtonImage.image = UIImage(named: "options")?.withRenderingMode(.alwaysTemplate)
        optionsButtonImage.tintColor = .white
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
        collectionView.register(NetflixCollectionViewCell.nib(), forCellWithReuseIdentifier: NetflixCollectionViewCell.identifier)
    }
    
    private func setupPageIndicator() {
        firstCellIndicatorView.layer.cornerRadius = firstCellIndicatorView.frame.height / 2
        secondCellIndicatorView.layer.cornerRadius = secondCellIndicatorView.frame.height / 2
        thirdCellIndicatorView.layer.cornerRadius = thirdCellIndicatorView.frame.height / 2
        fourthCellIndicatorView.layer.cornerRadius = fourthCellIndicatorView.frame.height / 2
    }
    
    private func updatePageIndicator(cellNumber: Int) {
        switch cellNumber {
        case 0:
            firstCellIndicatorView.backgroundColor = UIColor.white
            secondCellIndicatorView.backgroundColor = UIColor.gray
            thirdCellIndicatorView.backgroundColor = UIColor.gray
            fourthCellIndicatorView.backgroundColor = UIColor.gray
        case 1:
            firstCellIndicatorView.backgroundColor = UIColor.gray
            secondCellIndicatorView.backgroundColor = UIColor.white
            thirdCellIndicatorView.backgroundColor = UIColor.gray
            fourthCellIndicatorView.backgroundColor = UIColor.gray
        case 2:
            firstCellIndicatorView.backgroundColor = UIColor.gray
            secondCellIndicatorView.backgroundColor = UIColor.gray
            thirdCellIndicatorView.backgroundColor = UIColor.white
            fourthCellIndicatorView.backgroundColor = UIColor.gray
        default:
            firstCellIndicatorView.backgroundColor = UIColor.gray
            secondCellIndicatorView.backgroundColor = UIColor.gray
            thirdCellIndicatorView.backgroundColor = UIColor.gray
            fourthCellIndicatorView.backgroundColor = UIColor.white
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return netflixInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NetflixCollectionViewCell.identifier, for: indexPath) as? NetflixCollectionViewCell
        cell?.setupCell(netflixInfo: netflixInfos[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 180)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            
            if let indexPath = collectionView.indexPathForItem(at: visiblePoint) {
                updatePageIndicator(cellNumber: indexPath.row)
            }
        }
    
}
