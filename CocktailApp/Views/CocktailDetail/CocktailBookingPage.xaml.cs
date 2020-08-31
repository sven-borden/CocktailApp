using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Xamarin.Forms.Internals;
using CocktailApp.ViewModels.CocktailDetail;
using CocktailApp.Models;

namespace CocktailApp.Views.CocktailDetail
{
    [Preserve(AllMembers = true)]
    public partial class CocktailBookingPage : ContentPage
    {
        public CocktailBookingPageViewModel viewModel;

        /// <summary>
        /// Initializes a new instance of the <see cref="CocktailBookingPage" /> class.
        /// </summary>
        public CocktailBookingPage(Cocktail _cocktail)
        {
            InitializeComponent();
            BindingContext = viewModel = new CocktailBookingPageViewModel();
            viewModel.Navigation = Navigation;
            viewModel.Cocktail = _cocktail;

            if (_cocktail.IsFavourite)
            {
                favouriteButton.Text = "\ue732";
                Application.Current.Resources.TryGetValue("PrimaryColor", out var retVal);
                favouriteButton.TextColor = (Color)retVal;
            }
            else
            {
                favouriteButton.Text = "\ue701";
                Application.Current.Resources.TryGetValue("Gray-600", out var retVal);
                favouriteButton.TextColor = (Color)retVal;
            }
        }
    }
}