//
//  HistoryViewController.swift
//  ghostProjetc
//
//  Created by Raphael Alkamim on 07/06/22.
//

import UIKit

class HistoryViewController: ViewController {
    
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextView.contentInsetAdjustmentBehavior = .automatic
        myTextView.textAlignment = .left
        myTextView.backgroundColor = UIColor.clear
        myTextView.font = UIFont(name: "New York extra Large", size: 17)
        myTextView.font = UIFont.boldSystemFont(ofSize: 20)
        myTextView.textColor = UIColor(red: 85.0/255, green: 1/255, blue: 8/255, alpha: 1)
        myTextView.text = "Saudações a vós que recebeis esta mensagem. Quem vos fala é aquele que carrega a alcunha de fantasma do Lab, mesmo que esteja preso a esse prédio muito antes da construção deste laboratório. Desde que vós, excepcionais criaturas, voltaram a frequentar meu local de descanso,  sou pertubado por suas risadas, indivíduos me atravessando e toda sorte de incomodo.\n\nMas tenho me mantido atento a todos vós, e agora, é a minha vez de pertubar suas atividades.\n\nHá, por todo o laboratório, registros  de momentos únicos de todos vós, entes vis. Entretanto, para vê-los, é necessário estar em contato com o mundo espectral. Não se desesperem, atormentadas criaturas, pois com a magia presente neste espelho que carregam diariamente, vós conseguireis encontrá-los. Para aquele entre vós que encontrar o maior número de registros primeiro, eu me apresentarei e o recompensarei.\n\n\nQue a sorte esteja do vosso lado!"
        myTextView.isEditable = false
        myTextView.showsVerticalScrollIndicator = false
        
    }

    
}
