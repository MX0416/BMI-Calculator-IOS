
import UIKit

class ResultsViewController: UIViewController {
    
    // this is the result view, which shows when the calculate button is pressed on the main screen

    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue: String?
    var advice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BMILabel.text = bmiValue
        adviceLabel.text = advice
        
    }
    // when the screen loads, using the information passed from CalculatorViewController, display BMI value and advice
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    // go back to original screen when recalculate button is pressed
}
