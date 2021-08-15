//
//  PersonController.swift
//  SwiflixReborn
//
//  Created by Erik Radicheski da Silva on 13/08/21.
//

import Foundation

class PersonController {
    
    var trendingPeople = [Person]()
    
    var count: Int {
        get {
            return self.trendingPeople.count
        }
    }

    func loadPeopleList(onCompletion: (() -> Void)?) {

        TMDB.getTrending(mediaType: .person, timeWindow: .day) { response in
            self.trendingPeople = response.results
            onCompletion?()
        } onError: { error in
            #warning("Handle error")
            print(error)
        }
        
    }
    
    func selectPerson(at indexPath: IndexPath) -> Person {
        
        return self.trendingPeople[indexPath.row]
        
    }

}
