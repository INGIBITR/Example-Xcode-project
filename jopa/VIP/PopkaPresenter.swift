//
//  PopkaPresenter.swift
//  jopa
//
//  Created by Арсений Быков on 18.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class PopkaPresenter {
    
	weak var viewController: PopkaDisplayLogic?
	
}

extension PopkaPresenter: PopkaPresentationLogic {
    func prepareTextForLabel(text: String) { //у presenter'a есть доступ к viewController, а соответственно и к тексту(label) на экране, поэтому он просит viewController изменить текст в label 
        viewController?.textLabel.text = text
    }
    
	
}
