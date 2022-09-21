//
//  ApplicationListMenuView.swift
//  HelloActivity
//
//  Created by vuminhtam on 9/21/22.
//

import SwiftUI
import UIKit

struct ApplicationListMenuViewCustom: UIViewRepresentable {
    
    @Binding var indexItem: Int
    
    typealias UIViewType = ApplicationListMenuView

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> ApplicationListMenuView {
        let view = ApplicationListMenuView()
        view.delegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: ApplicationListMenuView, context: Context) {
    }
    
    class Coordinator: NSObject, ApplicationListMenuViewDelegate {
        
        var parent: ApplicationListMenuViewCustom
        
        init(_ parent: ApplicationListMenuViewCustom) {
            self.parent = parent
        }
        
        //MARK: Delegate
        func tapAction(applicationListMenuView: ApplicationListMenuView, index: Int) {
           print("user tap index: \(index)")
            parent.indexItem = index
        }
    }
}

import UIKit

protocol ApplicationListMenuViewDelegate: AnyObject {
    func tapAction(applicationListMenuView: ApplicationListMenuView, index: Int)
}

class ApplicationListMenuView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var firstLineView: UIView!
    @IBOutlet weak var secondLineView: UIView!
    @IBOutlet weak var threeLineView: UIView!
    @IBOutlet weak var firstLabelNSLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondLabelNSLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var threeLabelNSLayoutConstraint: NSLayoutConstraint!
    
    weak var delegate: ApplicationListMenuViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        firstLabelNSLayoutConstraint.constant =  labelFirst.intrinsicContentSize.width + 10
        secondLabelNSLayoutConstraint.constant =  labelSecond.intrinsicContentSize.width + 10
        threeLabelNSLayoutConstraint.constant =  labelThree.intrinsicContentSize.width + 10
        firstLineView.isHidden = false
        secondLineView.isHidden = true
        threeLineView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ApplicationListMenuView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func selectAction(_ sender: Any) {
        guard let bt = sender as? UIButton else { return }
        if bt.tag == 0 {
            firstLineView.isHidden = false
            secondLineView.isHidden = true
            threeLineView.isHidden = true
        }
        if bt.tag == 1 {
            firstLineView.isHidden = true
            secondLineView.isHidden = false
            threeLineView.isHidden = true
        }
        if bt.tag == 2 {
            firstLineView.isHidden = true
            secondLineView.isHidden = true
            threeLineView.isHidden = false
        }
        if let delegate = delegate {
            delegate.tapAction(applicationListMenuView: self, index: bt.tag)
        }
    }
}
