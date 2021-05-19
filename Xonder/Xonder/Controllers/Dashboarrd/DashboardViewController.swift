//
//  DashboardViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 12/05/2021.
//

import UIKit

class DashboardViewController: UIViewController {
    
    enum  CardState {
        case expanded
        case collapsed
    }
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var colView: UICollectionView!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var tabBarView: UIView!
    var cardViewController: TransactionViewController!
    var visualEffectView: UIVisualEffectView!
    
    var cardHeight: CGFloat!
    let cardHandleAreaHeight: CGFloat = 150
    
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed  : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCard()
    }
    
    @IBAction func settingAction(_ sender: Any) {
    }
    func setupCard(){
        cardHeight = self.view.frame.height - 64
        visualEffectView  = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        
        let vc =  UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(identifier: "TransactionViewController")  as! TransactionViewController
        cardViewController = vc
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight , width: self.view.bounds.width, height: cardHeight)
        cardViewController.view.clipsToBounds = true
        
        let  tapGesture  = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(recognizer:)))
        let panGestture  =  UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(recognizer:)))
        cardViewController.handleArea.addGestureRecognizer(tapGesture)
        cardViewController.handleArea.addGestureRecognizer(panGestture)
        
        self.view.bringSubviewToFront(tabBarView)
        
    }
    
   @objc func handleCardPan(recognizer: UIPanGestureRecognizer){
    
    switch recognizer.state {
    case .began :
        startInteractiveTransition(state: nextState, duration: 0.9)
    case .changed :
        let translation = recognizer.translation(in: self.cardViewController.handleArea)
        var fractionComplete  = translation.y / cardHeight
        fractionComplete  =  cardVisible  ? fractionComplete : -fractionComplete
        updateInteractiveTransaction(fractionCompleted: fractionComplete)
    case .ended :
        continueInteractiveTransaction()
        
    default:
        break
    }
        
    }
    
  @objc  func handleCardTap(recognizer: UITapGestureRecognizer){
    switch recognizer.state {
    case .ended :
        animateTransitionIfNeeded(state: nextState, duration: 0.9)
    default:
        break
    }
    }
    
    func animateTransitionIfNeeded (state: CardState, duration: TimeInterval){
        if runningAnimations.isEmpty{
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1){
                switch state{
                case .expanded:
                    self.cardViewController.view.frame.origin.y =  self.view.frame.height - self.cardHeight
                case .collapsed:
                    self.cardViewController.view.frame.origin.y =  self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            frameAnimator.addCompletion{ _  in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1){
                switch state  {
                case .expanded:
                    self.visualEffectView.effect  = UIBlurEffect(style: .dark)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            }
            
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
        }
    }
    
    func startInteractiveTransition(state: CardState, duration: TimeInterval){
        
        if runningAnimations.isEmpty{
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        
        for animator in runningAnimations{
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
        
    }
    
    func updateInteractiveTransaction(fractionCompleted: CGFloat){
        
        for  animator  in runningAnimations{
            animator.fractionComplete =  fractionCompleted + animationProgressWhenInterrupted
        }
        
    }
    
    func continueInteractiveTransaction(){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
    
}




extension  DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionViewCell", for: indexPath) as! DashboardCollectionViewCell
        
        pageCtrl.currentPage  = indexPath.item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: colView.frame.width - 20, height: colView.frame.height)
        }
    
}
