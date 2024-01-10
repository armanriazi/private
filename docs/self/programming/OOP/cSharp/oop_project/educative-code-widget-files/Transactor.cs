using System;
namespace VendingMachineProject
{
    class Transactor
    {   
        // Total amount available in the machine
        private int _amountAvailable;

        public Transactor()
        {   // Initializing to 100
            this._amountAvailable = 100;
        }
        // Adding to total
        public bool AddAmount(int bill)
        {
            if (ValidateBill(bill))
            {
                this._amountAvailable += bill;
                return true;
            }
            return false;
        }
        // Subtracting the change
        private void SubAmount(int change)
        {
            this._amountAvailable -= change;
        }
        // For getting change
        public bool GetChange(int userAmount) 
        {
            if (userAmount > 0)
            {
                SubAmount(userAmount);
                return true;
            }
            else return false;
        }
        // Check if the bill is valid
        private bool ValidateBill(int bill)
        {
            if (bill == 1 || bill == 2 || bill == 5 || bill == 10 || bill == 20 || bill == 50 || bill == 100)
            {
                return true;
            }
            return false;
        }


    }
}