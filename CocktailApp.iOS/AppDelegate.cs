using Syncfusion.XForms.iOS.ComboBox;
using Syncfusion.SfMaps.XForms.iOS;
using Syncfusion.SfCalendar.XForms.iOS;
using Syncfusion.SfRotator.XForms.iOS;
using Syncfusion.SfRating.XForms.iOS;
using Syncfusion.ListView.XForms.iOS;
using Syncfusion.XForms.iOS.Border;
using Syncfusion.XForms.iOS.ParallaxView;
using System;
using System.Collections.Generic;
using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;

using System.Linq;

using Foundation;
using UIKit;

using Syncfusion.XForms.iOS.Buttons;

namespace CocktailApp.iOS
{
    // The UIApplicationDelegate for the application. This class is responsible for launching the 
    // User Interface of the application, as well as listening (and optionally responding) to 
    // application events from iOS.
    [Register("AppDelegate")]
    public partial class AppDelegate : global::Xamarin.Forms.Platform.iOS.FormsApplicationDelegate
    {
        //
        // This method is invoked when the application has loaded and is ready to run. In this 
        // method you should instantiate the window, load the UI into it and then make the window
        // visible.
        //
        // You have 17 seconds to return from this method, or iOS will terminate your application.
        //
        public override bool FinishedLaunching(UIApplication app, NSDictionary options)
        {
            global::Xamarin.Forms.Forms.Init();
            SfComboBoxRenderer.Init();
            SfMapsRenderer.Init();
            SfCalendarRenderer.Init();
            SfRotatorRenderer.Init();
            SfRatingRenderer.Init();
            SfBorderRenderer.Init();
            SfListViewRenderer.Init();
            SfParallaxViewRenderer.Init();
            
			SfButtonRenderer.Init();
            AppCenter.Start("982cfe2f-ac1f-4aa1-925c-a5bc8fd892a5",
                   typeof(Analytics), typeof(Crashes));

            LoadApplication(new App());

            var result = base.FinishedLaunching(app, options);

            return result;
        }
    }
}
