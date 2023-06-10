using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eapha
{
    public class Product
    {
        // [item_id],[item_name],[price]
        public int Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
        public int Total { get; set; }
        public Product(int id, string name, int quantity, int price)
        {
            Id = id;
            Name = name;
            Price = price;
            Quantity = quantity;
            Total = price * quantity;
        }
    }
}