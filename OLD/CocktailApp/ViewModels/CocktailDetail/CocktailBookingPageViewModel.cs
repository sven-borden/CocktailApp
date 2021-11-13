using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Windows.Input;
using CocktailApp.Models;
using CocktailApp.Models.ContactUs;
using CocktailApp.Models.CocktailDetail;
using Syncfusion.SfMaps.XForms;
using Syncfusion.XForms.Buttons;
using Xamarin.Forms;
using Xamarin.Forms.Internals;
using SelectionChangedEventArgs = Syncfusion.SfCalendar.XForms.SelectionChangedEventArgs;
using System.Net.Http.Headers;
using System.Linq;
using CocktailApp.Helpers;

namespace CocktailApp.ViewModels.CocktailDetail
{
    /// <summary>
    /// ViewModel for room booking page.
    /// </summary>
    [Preserve(AllMembers = true)]
    public class CocktailBookingPageViewModel : BaseViewModel
    {
        #region Fields
        private Cocktail cocktail;

        private string selectionChangedCommand;

        private int selectedIndex;

        public INavigation Navigation;

        #endregion

        #region Command

        /// <summary>
        /// Gets or sets the command is executed when the favourite button is clicked.
        /// </summary>
        public Command FavouriteCommand { get; set; }

        /// <summary>
        /// Gets or sets the command is executed when the book button is clicked.
        /// </summary>
        private Command bookCommand;

        /// <summary>
        /// Gets or sets the command is executed when the carousel item is swiped.
        /// </summary>
        private Command selectionCommand;

        #endregion

        #region Constructor
        /// <summary>
        /// Initializes a new instance for the <see cref="CocktailBookingPageViewModel" /> class.
        /// </summary>

        public CocktailBookingPageViewModel()
        {
            this.FavouriteCommand = new Command(this.FavouriteButtonClicked);
        }

        #endregion

        #region Properties

        /// <summary>
        /// Gets or sets the property that has been bound with icon and labels, which display the resort details.
        /// </summary>
        public Cocktail Cocktail
        {
            get
            {
                return this.cocktail;
            }

            set
            {
                if (this.cocktail == value)
                {
                    return;
                }

                this.cocktail = value;
                this.NotifyPropertyChanged();
            }
        }

        
        /// <summary>
        /// Gets or sets the carusel view swipe item index.
        /// </summary>
        public int SelectedIndex
        {
            get { return selectedIndex; }
            set
            {
                if (selectedIndex == value)
                {
                    return;
                }
                selectedIndex = value;
                this.NotifyPropertyChanged();
            }
        }

        // <summary>
        /// Gets or sets the command that will be executed when an book button is selected.
        /// </summary>   
        public Command BookCommand
        {
            get
            {
                return this.bookCommand ?? (this.bookCommand = new Command(this.BookClicked));
            }
        }

        // <summary>
        /// Gets or sets the command that will be executed when an book button is selected.
        /// </summary>   
        public Command SelectionCommand
        {
            get
            {
                return this.selectionCommand ?? (this.selectionCommand = new Command(this.SelectionClicked));
            }
        }
        #endregion

        #region Methods

        private void FavouriteButtonClicked(object obj)
        {
            var button = obj as SfButton;

            if (button == null)
            {
                return;
            }

            if (button.Text == "\ue701")//Set as favourite
            {
                button.Text = "\ue732";
                Application.Current.Resources.TryGetValue("PrimaryColor", out var retVal);
                button.TextColor = (Color)retVal;
                Cocktail.IsFavourite = true;
            }
            else // Set as non favourite
            {
                button.Text = "\ue701";
                Application.Current.Resources.TryGetValue("Gray-600", out var retVal);
                button.TextColor = (Color)retVal;
                Cocktail.IsFavourite = false;
            }

            StorageHelper.CocktailsList.Where(c => c.ID == Cocktail.ID).FirstOrDefault().IsFavourite = Cocktail.IsFavourite;
            StorageHelper.SaveCocktails(StorageHelper.CocktailsList.ToList());
        }

        /// <summary>
        /// Invoked when the book button is clicked.
        /// </summary>
        /// <param name="obj">The Object</param>
        private void BookClicked(object obj)
        {
            //Do something
        }

        /// <summary>
        /// Invoked when carousel view item is swiped.
        /// </summary>
        /// <param name="obj">The rotator item</param>
        private void SelectionClicked(object obj)
        {
            this.SelectedIndex = this.Cocktail.PreviewImages.IndexOf(obj);
        }

        #endregion
    }

}
