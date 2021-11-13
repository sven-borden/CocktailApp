
using System;
using System.Diagnostics;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace CocktailApp
{
    public partial class App : Application
    {
        public static string BaseImageUrl { get; } = "https://cdn.syncfusion.com/essential-ui-kit-for-xamarin.forms/common/uikitimages/";

       
        public App()
        {
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MjkxMTE5QDMxMzgyZTMyMmUzMGhZSkwvVDJBM1Fzbk5UeUU2OCtTL2hIRWJIV0I0TSt4MkdGSjYzcW8wQlU9");

            InitializeComponent();

            MainPage = new NavigationPage(new CocktailApp.Views.Catalog.ArticleTilePage());

        }

        protected override void OnStart()
        {
            // Handle when your app starts
        }

        protected override void OnSleep()
        {
            // Handle when your app sleeps
        }

        protected override void OnResume()
        {
            // Handle when your app resumes
        }
    }
}
