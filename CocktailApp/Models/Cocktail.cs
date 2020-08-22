using System;
using System.Collections.Generic;
using System.Text;

namespace CocktailApp.Models
{
    public class Cocktail
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
        public Recipe Recipe { get; set; }
        public double PercentAlcohol { get; set; }
    }
}
