
import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var weightText: UILabel!
    // Created IBOutlets for the weight/height sliders and text
    
    var calculator = CalculatorBrain()
    // created a calculator object using CalculatorBrain(), so that calculator can be used to access functions in CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightText.text = "0.5m"
        weightText.text = "10Kg"
    }
    // display the lowest values in the height/weight UILabel when the screen loads
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", sender.value)
        heightText.text = "\(heightValue)m"
    }
    // IBAction for change in the height slider
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weightValue = String(format: "%.0f", sender.value)
        weightText.text = "\(weightValue)Kg"
    }
    // IBAction for change in the weight slider
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculator.calculateBMI(weight: weight, height: height)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    // actions performed when the calculate button is pressed.
    // using the height and weight values obtained from the sliders to calculate the BMI using a function from the calculator created above
    // perform the segueway into the results screen
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculator.getBMIValue()
            destinationVC.advice = calculator.getAdvice()
        }
    }
    // check if the segue identifier is correct, then pass the BMI value and advice into the result view
    
}

