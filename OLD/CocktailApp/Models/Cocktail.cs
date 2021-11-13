using CocktailApp.ViewModels;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using Xamarin.Forms;
using Xamarin.Forms.Internals;

namespace CocktailApp.Models
{
    /// <summary>
    /// Model for Cocktail templates.
    /// </summary>
    [JsonObject(MemberSerialization.OptOut)]
    public class Cocktail : BaseViewModel
    {
        #region Fields

        /// <summary>
        /// Gets or sets a value indicating whether the Cocktail is favourite.
        /// </summary>
        private bool isFavourite;

        #endregion

        #region Public Properties

        public int ID { get; set; }

        public string ImagePath { get; set; }

        public List<string> PreviewImages { get; set; }


        public string Name { get; set; }

        public string Description { get; set; }


        public double OverallRating { get; set; }

        public string TotalReviews { get; set; }


        public double Alcohol { get; set; }

        public string Tag { get; set; }

        public List<Ingredient> Recipe { get; set; }

        public double Version { get; set; }




        public bool IsFavourite
        {
            get
            {
                return this.isFavourite;
            }

            set
            {
                this.isFavourite = value;
                this.NotifyPropertyChanged();
            }
        }

        public string DominantColor { get; set; }
        #endregion
    }
}