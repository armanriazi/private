using System;
namespace VendingMachineProject
{
    abstract class Item
    {
        // Fields
        private string _itemName;
        private int _price;
        private readonly string _type;
        // Properties to read values
        public string ItemName
        {
            get
            {
                return this._itemName;
            }
        }


        public int Price
        {
            get
            {
                return this._price;
            }
        }

        public string Type
        {
            get
            {
                return this._type;
            }
        }

        // Constructor
        public Item(string itemName, int price, string type)
        {
            this._itemName = itemName;
            this._price = price;
            this._type = type;
        }

        // Abstract method
        public abstract string DisplayMessage();
        
    }
}