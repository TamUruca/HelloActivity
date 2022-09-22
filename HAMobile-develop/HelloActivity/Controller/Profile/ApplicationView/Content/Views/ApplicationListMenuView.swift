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
        view.firstLabel.text = R.string.localizable.menu_item_application_list_screen_application_list()
        view.secondLabel.text = R.string.localizable.menu_item_past_cancel_screen_application_list()
        view.threeLabel.text = R.string.localizable.menu_item_consultation_inquiry_screen_application_list()
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

enum ApllicationListMenu {
    case applicationList
    case pastCancel
    case consultationInquiry
}

class ApplicationListMenuView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var firstLineView: UIView!
    @IBOutlet weak var secondLineView: UIView!
    @IBOutlet weak var threeLineView: UIView!
    @IBOutlet weak var firstViewWidthNSLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var threeViewWidthNSLayoutConstraint: NSLayoutConstraint!
    
    weak var delegate: ApplicationListMenuViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        firstViewWidthNSLayoutConstraint.constant = firstLabel.intrinsicContentSize.width + 15
        threeViewWidthNSLayoutConstraint.constant = threeLabel.intrinsicContentSize.width + 15
        updateUI(type: .applicationList)
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
            updateUI(type: .applicationList)
        }
        if bt.tag == 1 {
            updateUI(type: .pastCancel)
        }
        if bt.tag == 2 {
            updateUI(type: .consultationInquiry)
        }
        if let delegate = delegate {
            delegate.tapAction(applicationListMenuView: self, index: bt.tag)
        }
    }
    
    func updateUI(type: ApllicationListMenu) {
        switch type {
        case .applicationList:
            firstLineView.isHidden = false
            firstLabel.textColor = .red
            
            secondLabel.textColor = .gray
            threeLabel.textColor = .gray
            secondLineView.isHidden = true
            threeLineView.isHidden = true
        case .pastCancel:
            secondLineView.isHidden = false
            secondLabel.textColor = .red
            
            firstLabel.textColor = .gray
            threeLabel.textColor = .gray
            firstLineView.isHidden = true
            threeLineView.isHidden = true
        case .consultationInquiry:
            threeLineView.isHidden = false
            threeLabel.textColor = .red
            
            firstLabel.textColor = .gray
            secondLabel.textColor = .gray
            firstLineView.isHidden = true
            secondLineView.isHidden = true
        }
    }
}
