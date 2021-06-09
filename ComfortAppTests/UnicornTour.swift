//
//  ComfortAppTests.swift
//  Unicorn-Tour
//
//  Created by Ekaterina Borobaenko on 05.05.2021.
//

import XCTest
@testable import ComfortApp

class UnicornTour: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testEnterValidDataInTextField() throws {
        let authVC = AuthViewController()
        authVC.setUp()
        let testLabel = authVC.mainLabel.text // "Авторизация\nКомфорт"
        authVC.loginTextfield.text = "1"
        authVC.sighIn() // Попытка входа с вводом только одного поля
        // mainLabel Должен поменять текст на "Заполните все поля"
        XCTAssertNotEqual(testLabel, authVC.mainLabel.text) // Проверка, что поля не равны
        XCTAssertEqual("Заполните все поля", authVC.mainLabel.text) // Проверка текста
    }

 

}
