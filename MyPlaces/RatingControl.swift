//
//  RatingControl.swift
//  MyPlaces
//
//  Created by Alexander on 19.02.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // Mark: Properties
    
    private var ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    var rating = 0
    
    //Для кажого подхода есть соотв инициализатор
    //init frame – для программной инициализации представления
    //init coder – для работы через storyboard
    
    //Инициализатор – это метод, который подготовливает экземпляр класса к использованию, который включает в себя установки начальных значений для каждого свойства и любые другие параметры необходимые для параметра объекта

    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button Action
    
    @objc
    func ratingButton(button: UIButton) {
        print("###Button pressed")
    }
    
    // MARK: Private Methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
            
            // Create the button
            let button = UIButton()
            button.backgroundColor = .red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(ratingButton(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button on the rating button array
            ratingButtons.append(button)
        }
    }
}
