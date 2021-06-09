//
//  Firebase.swift
//  Unicorn-Tour
//
//  Created by Ekaterina Borobaenko on 05.05.2021.
//
import Foundation

class Firebase {
    
    var users: [[String:String]] = [
        ["elon@mask.ru":"tesla"],
        ["tony@stark.ru":"ironman"],
        ["rick@sanchez.ru":"morty"],
        ["kopiev@x.ru":"vns"],
        ["1":"1"]
    ]
    
    
    func auth(login: String, password: String) -> Bool {
        if users.contains([login : password]){
            return true
        } else {
            return false
        }
    }
    
    func getData(from url: String) -> Data? {
        
        let realtys = [
            Realty(price: 28000, numberOfRooms: 1, square: 35, image: "rent", adress: "Москва, Бескудниковский б-р, 48к4", rent: true, typeRealty: "Квартира", description: "Сдам двухкомнатную квартиру, без животных. Возможно на две семьи. Собственник."),
            Realty(price: 2300000, numberOfRooms: 3, square: 75, image: "sale", adress: "ул. Лобачевского/платформа «Матвеевская», кв-л 9.2", rent: false, typeRealty: "Квартира"),
            Realty(price: 9999000, numberOfRooms: 5, square: 256, image: "house", adress: "Москва, Западный административный округ, Можайский район'", rent: false, typeRealty: "Дом",description: "Арт. 47798059 Земли населенных пунктов, ИЖС. Коттедж 350 м.кв. на участке 15 соток, расположен в жилом поселке Сетунька, в пешей доступности от центра Сколково"),
            Realty(price: 900000, numberOfRooms: 0, square: 600, image: "place", adress: "Московская область, Орехово-Зуевский г.о., д. Беззубово", rent: false, typeRealty: "Земельный участок"),
        ]
        let clients = [
            Client(name: "Иван Пушкин", adress: "ivanpush@mail.ru", phone: "8 911 546 09 11", realtyType: "Египет", dealType: "Оплачено"),
            Client(name: "Татьяна Финикова", adress: "fin@bk.ru", phone: "8 905 477 55 99", realtyType: "Египет", dealType: "Бронь"),
            Client(name: "Евгений Щербаков", adress: "evgen@ya.ru", phone: "8 905 255 65 65", realtyType: "Анапа", dealType: "Сдал тур"),
         
        ]
        
        let dataProvider = DataProvider(realtys: realtys, clients: clients)
        let parser = Parser()
        return parser.encodeJSON(type: DataProvider.self, data: dataProvider)
    }
}

struct DataProvider: Codable {
    
    var realtys: [Realty]
    var clients: [Client]

    init(realtys: [Realty], clients: [Client]) {

        self.realtys = realtys
        self.clients = clients
    }
}

