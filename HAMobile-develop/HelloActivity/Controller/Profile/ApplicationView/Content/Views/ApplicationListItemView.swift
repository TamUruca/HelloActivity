//
//  ApplicationListItem.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/22/22.
//

import SwiftUI
import UIKit

struct ApplicationListItemViewCustom: UIViewRepresentable {
    var applicationItem: ApplicationItem

    typealias UIViewType = ApplicationListItemView
    
    var selectAction: (() -> Void)?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> ApplicationListItemView {
        let view = ApplicationListItemView()
        view.iconImageView.image = UIImage(named: applicationItem.iconImage.isEmpty ? "banner": applicationItem.iconImage)
        view.titlelabel.text = applicationItem.title
        view.firstLabel.text = applicationItem.reservationNumber
        view.secondLabel.text = applicationItem.country
        view.threeLabel.text = applicationItem.date
        view.fourLabel.text = applicationItem.description
        view.backgroundTitleView.backgroundColor = applicationItem.color
        view.delegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: ApplicationListItemView, context: Context) {
        
    }

    class Coordinator: NSObject, ApplicationListItemViewDelegate {
        
        var parent: ApplicationListItemViewCustom

        init(_ parent: ApplicationListItemViewCustom) {
            self.parent = parent
        }

        //MARK: Delegate
        func tapAction(applicationListItemView: ApplicationListItemView) {
            print("user tap !!!")
            parent.selectAction?()
        }
    }
}

import UIKit

protocol ApplicationListItemViewDelegate: AnyObject {
    func tapAction(applicationListItemView: ApplicationListItemView)
}

class ApplicationListItemView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var backgroundTitleView: UIView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    
    weak var delegate: ApplicationListItemViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        mainBackgroundView.layer.borderColor = UIColor.gray.cgColor
        mainBackgroundView.layer.borderWidth = 1.0
        mainBackgroundView.layer.cornerRadius = 15
        
        iconImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        iconImageView.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ApplicationListItemView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func selectAction(_ sender: Any) {
        if let delegate = delegate {
            delegate.tapAction(applicationListItemView: self)
        }
    }
}
