
import UIKit

struct CalculatorBrain{
    
    // CalculatorBrain performs all the calculations and selects the correct advice for each BMI value
    
    var bmi: BMI?
    
    mutating func calculateBMI(weight: Float, height: Float){
        
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You are in the underweight range!")
        } else if bmiValue < 25 {
            bmi = BMI(value: bmiValue, advice: "You are in the healthy weight range!")
        } else if bmiValue < 30 {
            bmi = BMI(value: bmiValue, advice: "You are in the overweight range!")
        } else{
            bmi = BMI(value: bmiValue, advice: "You are in the obese range!")
        }
        // checks BMI value and give corresponding advice
    }
    
    func getBMIValue() -> String{
        
        if bmi != nil{
            return String(format: "%.2f", bmi?.value ?? "No BMI value recieved!")
        } else{
            return "Try enter height and weight values again"
        }
    }
    // this mathod returns the BMI value when called
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No BMI value recieved!"
    }
    // this method returns the advice when called
    
}

