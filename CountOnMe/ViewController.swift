
import UIKit

class ViewController: UIViewController, CalcInteractor {
    @IBOutlet weak var label: UILabel!
    private lazy var calculator: CalcModel = CalcModel(interactor: self)
    var working:String = ""
    @IBOutlet var numberButtons: [UIButton]!
    
    func clearAll() {
        working = ""
        label.text = ""
    }
    
    func onError(message: String) {
        let alertVC = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func onText(text: String) {
        label.text = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(_ sender: Any) {
        
    }
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        calculator.tapped(number: numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        calculator.tappedOpe(operand: "+")
    }
    
    @IBAction func tappedSubtractionButton(_ sender: UIButton) {
        calculator.tappedOpe(operand: "-")
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        calculator.tappedOpe(operand: "*")
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        calculator.tappedOpe(operand: "/")
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.makeOperation()
    }
    
    @IBAction func back(_sender:UIButton) {
            clearAll()
        }
    
}
