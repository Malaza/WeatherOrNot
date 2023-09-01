//
//  CurrentWeatherView.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/09/01.
//

import UIKit

class CurrentWeatherView: UIView {

    //MARK: - Outlets
    @IBOutlet weak var weatherImageView: UIImageView!

    @IBOutlet weak var currentLabel: UILabel! {
        didSet {
            currentLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var forecastView: UIView!

    @IBOutlet weak var minWeatherLabel: UILabel! {
        didSet {
            minWeatherLabel.numberOfLines = 0
        }
    }

    @IBOutlet weak var currentWeatherLabel: UILabel! {
        didSet {
            currentWeatherLabel.numberOfLines = 0
        }
    }

    @IBOutlet weak var maxWeatherLabel: UILabel! {
        didSet {
            maxWeatherLabel.numberOfLines = 0
        }
    }
    
    
    //MARK: - Variables
    var contentView: UIView?

    
    //MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CurrentWeatherView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configureCurrentView(model: CurrentWeatherModel) {
        self.currentLabel.attributedText = self.attributedStringForTitle(title: model.temp, subTitle: model.mainWeather.uppercased(), large: true)
        self.minWeatherLabel.attributedText = self.attributedStringForTitle(title: model.tempMin, subTitle: "Min", large: false)
        self.currentWeatherLabel.attributedText = self.attributedStringForTitle(title:model.tempMax, subTitle: "Current", large: false)
        self.maxWeatherLabel.attributedText = self.attributedStringForTitle(title: model.temp, subTitle: "Max", large: false)
        self.weatherImageView.image = UIImage(named: model.type.rawValue)
    }
    
    
    //MARK: - Helper methods
    func attributedStringForTitle(title:String, subTitle:String, large: Bool) -> NSAttributedString {

        let attrHeading:NSMutableAttributedString
        let attrContent:NSMutableAttributedString
        let mainAttributedString = NSMutableAttributedString()

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.paragraphSpacing = 4.0

        attrHeading = NSMutableAttributedString(string: title)
        let range = NSRange.init(location: 0, length: title.count)
        let titleSize = large == true ? 70.0 : 20.0
        attrHeading.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: titleSize, weight: .semibold), range: range)
        attrHeading.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range)
        mainAttributedString.append(attrHeading)

        let stringFormat = String(format: "\n\(subTitle)")
        attrContent = NSMutableAttributedString(string: stringFormat)
        let thisRange = NSRange.init(location: 0, length: stringFormat.count)
        let subTitleSize = large == true ? 25 : 15.0
        attrContent.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: subTitleSize, weight: .medium), range: thisRange)
        attrContent.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: thisRange)
        mainAttributedString.append(attrContent)

        mainAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,
                                          range: NSRange.init(location: 0, length: mainAttributedString.length))

        return mainAttributedString
    }
}
