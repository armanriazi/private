using System;
namespace VendingMachineProject
{
    class SnackItem : Item
    {
        public SnackItem(string name, int price)
            : base(name, price, "Snack")
        {

        }

        public override string DisplayMessage()
        {
            return "Name: " + base.ItemName + " Price: " + base.Price + "$" + " Type: " + base.Type;
        }

    }
}