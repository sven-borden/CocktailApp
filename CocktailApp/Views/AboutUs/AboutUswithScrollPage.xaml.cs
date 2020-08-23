﻿using Xamarin.Forms.Internals;
using Xamarin.Forms.Xaml;

namespace CocktailApp.Views.AboutUs
{
    /// <summary>
    /// About us with parallax scroll page.
    /// </summary>
    [Preserve(AllMembers = true)]
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AboutUsWithScrollPage
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="T:CocktailApp.Views.AboutUs.AboutUsWithParallaxScrollPage"/> class.
        /// </summary>
        public AboutUsWithScrollPage()
        {
            InitializeComponent();
        }
    }
}