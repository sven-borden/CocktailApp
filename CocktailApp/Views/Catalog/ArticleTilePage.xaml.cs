using CocktailApp.Helpers;
using CocktailApp.Models;
using CocktailApp.ViewModels.Catalog;
using Microsoft.AppCenter.Crashes;
using System;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using Xamarin.Forms;
using Xamarin.Forms.Internals;
using Xamarin.Forms.Xaml;

namespace CocktailApp.Views.Catalog
{
    /// <summary>
    /// Page to show the article tile
    /// </summary>
    public partial class ArticleTilePage
    {
        public ArticleListViewModel viewModel;

        /// <summary>
        /// Initializes a new instance of the <see cref="ArticleTilePage" /> class.
        /// </summary>
        public ArticleTilePage()
        {
            try
            {
                InitializeComponent();
            }
            catch(Exception e)
            {
                Crashes.TrackError(e);
            }
            
            BindingContext = viewModel = new ArticleListViewModel();
            viewModel.Navigation = Navigation;
        }

        /// <summary>
        /// Invoked when view size is changed.
        /// </summary>
        /// <param name="width">The Width</param>
        /// <param name="height">The Height</param>
        protected override void OnSizeAllocated(double width, double height)
        {
            base.OnSizeAllocated(width, height);

            if (width > height)
            {
                GridLayout.SpanCount = Device.Idiom == TargetIdiom.Phone ? 3 : 4;
            }
            else
            {
                GridLayout.SpanCount =
                    Device.Idiom == TargetIdiom.Phone ? 2 : Device.Idiom == TargetIdiom.Tablet ? 3 : 4;
            }
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            viewModel.FeaturedStories = new ObservableCollection<Cocktail>(StorageHelper.CocktailsList.Where(c => c.IsFavourite == true));
        }

        private async void SettingsClicked(object sender, System.EventArgs e)
        {
            await Navigation.PushAsync(new AboutUs.AboutUsWithCardsPage());
        }
    }
}