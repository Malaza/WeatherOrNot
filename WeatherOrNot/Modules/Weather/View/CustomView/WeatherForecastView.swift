//
//  WeatherForecastView.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/09/01.
//

import UIKit

class WeatherForecastView: UIView {

    let identifier = "WeatherForecastView"
    
    
    //MARK: - Outlets
    @IBOutlet private weak var tuesdayLabel: UILabel! {
        didSet {
            tuesdayLabel.textColor = .white
            tuesdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var tuesdayImageView: UIImageView!
    
    @IBOutlet private weak var tuesdayWeatherLabel: UILabel! {
        didSet {
            tuesdayWeatherLabel.textColor = .white
            tuesdayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var wednesdayLabel: UILabel! {
        didSet {
            wednesdayLabel.textColor = .white
            wednesdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var wednesdayImageView: UIImageView!
    
    @IBOutlet private weak var wednesdayWeatherLabel: UILabel! {
        didSet {
            wednesdayWeatherLabel.textColor = .white
            wednesdayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var thursdayLabel: UILabel! {
        didSet {
            thursdayLabel.textColor = .white
            thursdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var thursdayImageView: UIImageView!
    
    @IBOutlet private weak var thursdayWeatherLabel: UILabel! {
        didSet {
            thursdayWeatherLabel.textColor = .white
            thursdayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var fridayLabel: UILabel! {
        didSet {
            fridayLabel.textColor = .white
            fridayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var fridayImageView: UIImageView!
    
    @IBOutlet private weak var fridayWeatherLabel: UILabel! {
        didSet {
            fridayWeatherLabel.textColor = .white
            fridayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var saturdayLabel: UILabel! {
        didSet {
            saturdayLabel.textColor = .white
            saturdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var saturdayImageView: UIImageView!
    
    @IBOutlet private weak var saturdayWeatherLabel: UILabel! {
        didSet {
            saturdayWeatherLabel.textColor = .white
            saturdayWeatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
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
    
    init() {
        super.init(frame: CGRect.zero)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.identifier, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configureForecastView(model: [ForecastModel]) {
        
        self.tuesdayImageView.image = self.getImageWithType(type: model[0].type)
        self.tuesdayWeatherLabel.text = model[0].temp
        
        self.wednesdayImageView.image = self.getImageWithType(type: model[1].type)
        self.wednesdayWeatherLabel.text = model[1].temp
        
        self.thursdayImageView.image = self.getImageWithType(type: model[2].type)
        self.thursdayWeatherLabel.text = model[2].temp
        
        self.fridayImageView.image = self.getImageWithType(type: model[3].type)
        self.fridayWeatherLabel.text = model[3].temp
        
        self.saturdayImageView.image = self.getImageWithType(type: model[4].type)
        self.saturdayWeatherLabel.text = model[4].temp
    }
    
    
    //MARK: - Helper methods
    func getImageWithType(type: WeatherType) -> UIImage {
        return UIImage(named: "ic_\(type.rawValue)")!
    }
}
