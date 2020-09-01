//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var textAnimalLabel: UILabel!
    
    var animalAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        selectAnimal()
    }
    
}

extension ResultsViewController {
    private func selectAnimal() {
        var animalCount: [AnimalType: Int] = [.dog: 0, .cat: 0, .rabbit: 0, .turtle: 0]
        for animal in animalAnswers {
            animalCount[animal.type]! += 1
        }
        let sortedAnimalCount = animalCount.sorted(by: {$0.value > $1.value})
        let chosenAnimal = sortedAnimalCount.first!.key
        animalLabel.text = "Вы - \(chosenAnimal.rawValue)!"
        textAnimalLabel.text = chosenAnimal.definition
    }
}
