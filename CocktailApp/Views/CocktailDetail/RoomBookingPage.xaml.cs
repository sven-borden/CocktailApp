﻿using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Xamarin.Forms.Internals;

namespace CocktailApp.Views.CocktailDetail
{
    [Preserve(AllMembers = true)]
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class RoomBookingPage : ContentPage
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="RoomBookingPage" /> class.
        /// </summary>
        public RoomBookingPage()
        {
            InitializeComponent();
        }
    }
}