//
//  PopkaProtocols.swift
//  jopa
//
//  Created by Арсений Быков on 18.11.2020.
//

import UIKit

protocol PopkaDisplayLogic: AnyObject {
    var textLabel : UILabel { get }  
  func displaySomething()
}

protocol PopkaBusinessLogic {
    func didChangeTextInSearchBar(text: String)
    
    
}

protocol PopkaDataStore: AnyObject {
    var textInLabel: String { get set }
    
}

protocol PopkaPresentationLogic {
    func prepareTextForLabel(text: String)
    
}

protocol PopkaRoutingLogic {
	
}

protocol PopkaDataPassing {
	var dataStore: PopkaDataStore? { get }
    
}
