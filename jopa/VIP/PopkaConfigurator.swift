//
//  PopkaConfigurator.swift
//  jopa
//
//  Created by Арсений Быков on 18.11.2020.
//

import UIKit

class PopkaModule {
	static func build() -> PopkaVC {    // тут создаются связи по архитектуре VIP  
		//let dataSource = ...
		let viewController = PopkaVC()
		let interactor = PopkaInteractor()
		
		let presenter = PopkaPresenter()
		//presenter.dataSource = dataSource
		presenter.viewController = viewController
		
		let router = PopkaRouter()
		router.viewController = viewController
		viewController.router = router
		
		//interactor.dataSource = dataSource
		interactor.presenter = presenter
		router.dataStore = interactor
		viewController.interactor = interactor
		
		
		
		return viewController
	}
}
