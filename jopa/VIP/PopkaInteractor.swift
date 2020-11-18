//
//  PopkaInteractor.swift
//  jopa
//
//  Created by Арсений Быков on 18.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class PopkaInteractor: PopkaDataStore {
    var textInLabel: String = "" //инициализируем переменную
    
	var presenter: PopkaPresentationLogic? //создаем presenter
}

extension PopkaInteractor: PopkaBusinessLogic {
    func didChangeTextInSearchBar(text: String) {
        textInLabel = text
        
        presenter?.prepareTextForLabel(text: textInLabel) // получаем введенный текст на вход, записываем его в textInLabel и передаем его в качестве параметра функции в presenter для того, чтобы он поменял на view нам значение label - опционал аналогичноы
    }
    
	
}
