using System;
namespace VendingMachineProject
{
    class KeyPad
    {
        public KeyPad()
        {
        }
        // Method to read input
        public int readKey()
        {
            string userInput;
            userInput = Console.ReadLine();
            /* Converts to integer type */
            int value;
            if (int.TryParse(userInput, out value) && value > 0)
            {
                return value;
            }
            else return -1;
        }
    }
}