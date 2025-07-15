/* Date: Wednesday, 19th March, 2025 */
/* Author: Sylvia Dogbatsey */
/* Description: Second program in C++ */

/* To run the program in a MACOS or Windows terminal, use the following command: */
/* g++ -o dummyname filename.cpp */
/* Next run the dummy name: ./dummyname */

#include <iostream>
using namespace std;

int main(){
    float TakeHomePay;
    float ProposedMonthlyRent;
    float MonthlyRent;
    float MonthlyTithe;
    float MonthlyOffering;
    float MonthlyElectricity;
    float MonthlyWater;
    float MonthlyPhone;
    float MonthlyInternet;
    float MonthlyAutoInsuranceMaintain;
    float MonthlyFuel;
    float MonthlyFood;
    float MonthlyClothing;
    float MonthlyParents;
    float MonthlyMiscellaneous;
    float TotalMonthlyExpenses;
    float RemainingAmount;
    float EmergencyFund;

    cout<< "Enter your monthly take home pay after taxes. \n ";
    cin>> TakeHomePay;
    ProposedMonthlyRent = 0.25 * TakeHomePay;
    cout<< "Your rent should not be more than " <<ProposedMonthlyRent<< ", which is 25 percent of your take home pay. \n";
    cout<< "Enter your monthly tithe \n";
    cin>> MonthlyTithe;
    cout<< "Enter your monthly offering \n";
    cin>> MonthlyOffering;
    cout<< "Enter your monthly rent \n";
    cin>> MonthlyRent;
    cout<< "Enter your average monthly electricity bill \n";
    cin>> MonthlyElectricity;
    cout<< "Enter your average monthly water bill \n";
    cin>> MonthlyWater;
    cout<< "Enter your average monthly phone bill \n";
    cin>> MonthlyPhone;
    cout<< "Enter your average monthly internet bill \n";
    cin>> MonthlyInternet;
    cout<< "Enter your average monthly car insurance and maintenance bill \n";
    cin>> MonthlyAutoInsuranceMaintain;
    cout<< "Enter your average monthly fuel bill \n";
    cin>> MonthlyFuel;
    cout<< "Enter your average monthly food bill \n";
    cin>> MonthlyFood;
    cout<< "Enter your average monthly clothing bill \n";
    cin>> MonthlyClothing;
    cout<< "Enter the amount you send to your parents monthly \n";
    cin>> MonthlyParents;
    cout<< "Enter your average monthly miscellaneous bill \n";
    cin>> MonthlyMiscellaneous;
    
    TotalMonthlyExpenses = MonthlyRent + MonthlyTithe + MonthlyOffering + MonthlyElectricity + MonthlyWater + 
                      MonthlyPhone + MonthlyInternet + MonthlyAutoInsuranceMaintain + MonthlyFuel + MonthlyFood + 
                      MonthlyClothing + MonthlyParents + MonthlyMiscellaneous;

    RemainingAmount = TakeHomePay - TotalMonthlyExpenses;

    cout<< "You should save at least " <<RemainingAmount<< " dollars every month.\n";
    EmergencyFund = 6 * TotalMonthlyExpenses;
    cout<< "Based on your monthly expenses, your 6 months emergency fund should be "<<EmergencyFund<<".\n";

    return 0;
}