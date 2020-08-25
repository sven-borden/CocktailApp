using CocktailApp.ViewModels;
using System;
using System.Collections.Generic;
using Xamarin.Forms.Internals;

namespace CocktailApp.Models
{
    /// <summary>
    /// Model for Cocktail templates.
    /// </summary>
    public class Cocktail : BaseViewModel
    {
        #region Fields

        /// <summary>
        /// Gets or sets a value indicating whether the Cocktail is bookmarked
        /// </summary>
        private bool isBookmarked;

        /// <summary>
        /// Gets or sets a value indicating whether the Cocktail is favourite.
        /// </summary>
        private bool isFavourite;

        #endregion

        #region Public Properties

        /// <summary>
        /// Gets or sets the Cocktail image path.
        /// </summary>
        public string ImagePath { get; set; }

        /// <summary>
        /// Gets or sets the Cocktail preview images path</summary>
        public List<string> PreviewImages { get; set; }


        /// <summary>
        /// Gets or sets the Cocktail name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the Cocktail description
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// Gets or sets the overall of the cocktail.
        /// </summary>
        public double OverallRating { get; set; }

        /// <summary>
        /// Gets or sets the reviews of the resort.
        /// </summary>
        public string TotalReviews { get; set; }

        /// <summary>
        /// Gets or sets the Cocktail alcohol percentage
        /// </summary>
        public double Alcohol { get; set; }

        /// <summary>
        /// Gets or sets the Cocktail tag //e.g. sweet, dry
        /// </summary>
        public string Tag { get; set; }

        /// <summary>
        /// Gets or sets the Cocktail recipe
        /// </summary>
        public Recipe Recipe { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether the Cocktail is bookmarked.
        /// </summary>
        public bool IsBookmarked
        {
            get
            {
                return this.isBookmarked;
            }

            set
            {
                this.isBookmarked = value;
                this.NotifyPropertyChanged();
            }
        }

        /// <summary>
        /// Gets or sets a value indicating whether the Cocktail is favourite.
        /// </summary>
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

        /// <summary>
        /// Gets or sets the bookmarked count.
        /// </summary>
        public int BookmarkedCount { get; set; }

        /// <summary>
        /// Gets or sets the favourite count.
        /// </summary>
        public int FavouritesCount { get; set; }

        /// <summary>
        /// Gets or sets the shared count.
        /// </summary>
        public int SharedCount { get; set; }

        #endregion
    }
}