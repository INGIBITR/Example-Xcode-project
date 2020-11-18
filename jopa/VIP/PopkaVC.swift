//
//  PopkaVC.swift
//  jopa
//
//  Created by Арсений Быков on 18.11.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class PopkaVC: UIViewController {
	var interactor: PopkaBusinessLogic?                     // Шаблон VIP, как я понимаю, он подлкючает интерактор(в файле PopkaInteractor), конкретно здесь подключается обработчик логики, то есть он будет обрабатывать наше взаимодействие со view
	var router: (PopkaRoutingLogic & PopkaDataPassing)?
    // В этом примере не используется, от Арсения понял, что роутер нам нужен будет для перемещения между ViewController'ами, в нашем случае(Daily) - переход от вида настроек в какой-то определенный раздел, который мы выбираем нажатием на ячейку
    var searchBar = UISearchBar() // просто создаем поле ввода текста и label, в котором текст потом меняем
    var textLabel = UILabel()
    
    override func loadView() {
        super.loadView()
        
        constraintTextLabel()
        constraintTextField()
        textLabel.text = "ASS"
       // Здесь мы вызвали функции конфигурации нашего поля ввода текста и label'a
       // Сами функции описаны ниже, чтобы не загромождать loadview()
        
    }
    
    
    func constraintTextField() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false // чтобы не было конфликтов с другим способом размещения элементов
        view.addSubview(searchBar) // добавляем наше поле ввода на экран view
        NSLayoutConstraint.activate([ //массив ограничений по расположению
            searchBar.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50), //верхний край searchBar'a отступает от нижнего края текста 50 пикселей
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100), // отступаем от правого края 100
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100) // и от левого 100
        ])
        //получается, что ширина searchBar'a будет равна (ширина view - 100 слева - 100 справа) - на разных экранах будет разная ширина
       
        searchBar.placeholder = "300 BUCKS" // значение, которое отображается в поле до ввода текста
        
        
            }
    
    func constraintTextLabel() { // все аналогично
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // "прибиваем" наш label посередине экрана с отсупом сверху в 150 пикселей

        ])
    }
    
    
    
	override func viewDidLoad() {
    super.viewDidLoad()
        view.backgroundColor = .white  //после того, как наш view загрузился в память(и уже готов собственно), мы меняем у него цвет и ставим делегата нашему полю поиска - тут хорошо о делегате написано https://habr.com/ru/post/510882/
        searchBar.delegate = self
	
	}
  
}
extension PopkaVC: PopkaDisplayLogic {
  
       // пустая функция
    
    
	func displaySomething() {
	  
	}
}
extension PopkaVC : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder() // убираем клавиатуру после нажатия на кнопку поиск
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor?.didChangeTextInSearchBar(text: searchText) //передаем в интерактор сигнал, что в ячейке поменялся текст searchText; опционал стоит для того, чтобы приложение не сломалось, если интерактор куда-то пропадет
        
    }
}
