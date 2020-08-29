using CocktailApp.Helpers;
using CocktailApp.Models;
using CocktailApp.Views.CocktailDetail;
using Syncfusion.DataSource.Extensions;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using Xamarin.Forms;
using Xamarin.Forms.Internals;

namespace CocktailApp.ViewModels.Catalog
{
    /// <summary>
    /// ViewModel for article list page.
    /// </summary> 
    [Preserve(AllMembers = true)]
    public class ArticleListViewModel : BaseViewModel
    {
        #region Fields

        private ObservableCollection<Cocktail> featuredStories;

        private ObservableCollection<Cocktail> latestStories;

        public INavigation Navigation;
        #endregion

        #region Constructor
        /// <summary>
        /// Initializes a new instance for the <see cref="ArticleListViewModel" /> class.
        /// </summary>
        public ArticleListViewModel()
        {

            this.LatestStories = new ObservableCollection<Cocktail>();
            this.FeaturedStories = new ObservableCollection<Cocktail>();

            LoadLocalData();




            this.MenuCommand = new Command(this.MenuClicked);
            this.BookmarkCommand = new Command(this.BookmarkButtonClicked);
            this.FeatureStoriesCommand = new Command(this.FeatureStoriesClicked);
            this.ItemSelectedCommand = new Command(this.ItemSelected);
            LoadOnlineData();

        }
        #endregion

        #region Public Properties
        /// <summary>
        /// Gets or sets the property that has been bound with the rotator view, which displays the articles featured stories items.
        /// </summary>
        public ObservableCollection<Cocktail> FeaturedStories
        {
            get
            {
                return this.featuredStories;
            }

            set
            {
                if (this.featuredStories == value)
                {
                    return;
                }

                this.featuredStories = value;
                this.NotifyPropertyChanged();
            }
        }

        /// <summary>
        /// Gets or sets the property that has been bound with the list view, which displays the articles latest stories items.
        /// </summary>
        public ObservableCollection<Cocktail> LatestStories
        {
            get
            {
                return this.latestStories;
            }

            set
            {
                if (this.latestStories == value)
                {
                    return;
                }

                this.latestStories = value;
                this.NotifyPropertyChanged();
            }
        }
        #endregion

        #region Command

        /// <summary>
        /// Gets or sets the command that will be executed when the menu button is clicked.
        /// </summary>
        public Command MenuCommand { get; set; }

        /// <summary>
        /// Gets or sets the command that will be executed when the bookmark button is clicked.
        /// </summary>
        public Command BookmarkCommand { get; set; }

        /// <summary>
        /// Gets or sets the command that will executed when the feature stories item is clicked.
        /// </summary>
        public Command FeatureStoriesCommand { get; set; }

        /// <summary>
        /// Gets or sets the command that will be executed when an item is selected.
        /// </summary>
        public Command ItemSelectedCommand { get; set; }

        #endregion

        #region Methods

        private async void  LoadOnlineData()
        {
            await StorageHelper.GetCocktails(false);

            LoadLocalData();
        }
        private async void LoadLocalData()
        {
            await StorageHelper.GetCocktails(true);
            try
            {
                this.FeaturedStories = new ObservableCollection<Cocktail>(StorageHelper.CocktailsList.Where(c => c.IsFavourite == true));
                this.LatestStories = new ObservableCollection<Cocktail>(StorageHelper.CocktailsList);
            }
            catch (Exception e)
            {
                Debug.Print(e.Message);
            }
        }


        /// <summary>
        /// Invoked when the menu button is clicked.
        /// </summary>
        /// <param name="obj">The Object</param>
        private void MenuClicked(object obj)
        {
            // Do something
        }

        /// <summary>
        /// Invoked when the bookmark button is clicked.
        /// </summary>
        /// <param name="obj">The object</param>
        private void BookmarkButtonClicked(object obj)
        {
            if (obj is Cocktail cocktail)
            {
                cocktail.IsBookmarked = !cocktail.IsBookmarked;
            }
        }

        /// <summary>
        /// Invoked when the the feature stories item is clicked.
        /// </summary>
        /// <param name="obj">The object</param>
        private async void FeatureStoriesClicked(object obj)
        {
            Cocktail SelectedCocktail = (obj as Cocktail);
            await Navigation.PushAsync(new CocktailBookingPage(SelectedCocktail));
        }

        /// <summary>
        /// Invoked when an item is selected.
        /// </summary>
        /// <param name="obj">The Object</param>
        private async void ItemSelected(object obj)
        {
            var ItemData = (obj as Syncfusion.ListView.XForms.ItemTappedEventArgs).ItemData as Cocktail;
            await Navigation.PushAsync(new CocktailBookingPage(ItemData));
        }

        #endregion
    }
}
