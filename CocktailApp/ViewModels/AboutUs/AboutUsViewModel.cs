using System.Collections.ObjectModel;
using CocktailApp.Models.AboutUs;
using Xamarin.Forms;
using Xamarin.Forms.Internals;

namespace CocktailApp.ViewModels.AboutUs
{
    /// <summary>
    /// ViewModel of AboutUs templates.
    /// </summary>
    [Preserve(AllMembers = true)]
    public class AboutUsViewModel : BaseViewModel
    {
        #region Fields

        private string productDescription;

        private string productVersion;

        private string productIcon;

        private string cardsTopImage;

        #endregion

        #region Constructor

        /// <summary>
        /// Initializes a new instance for the <see cref="T:CocktailApp.ViewModels.AboutUs.AboutUsViewModel"/> class.
        /// </summary>
        public AboutUsViewModel()
        {
            this.productDescription =
                "We want to make the best experience for our friends, blablbala to fill out";
            this.productIcon = App.BaseImageUrl + "Icon.png";
            this.productVersion = "1.0";
            this.cardsTopImage = App.BaseImageUrl + "Mask.png";

            this.EmployeeDetails = new ObservableCollection<AboutUsModel>
            {
                new AboutUsModel
                {
                    EmployeeName = "Sven Borden",
                    Image = App.BaseImageUrl + "ProfileImage15.png",
                    Designation = "Developper"
                }
            };

            this.ItemSelectedCommand = new Command(this.ItemSelected);
        }

        #endregion

        #region Properties

        /// <summary>
        /// Gets or sets the top image source of the About us with cards view.
        /// </summary>
        /// <value>Image source location.</value>
        public string CardsTopImage
        {
            get
            {
                return this.cardsTopImage;
            }

            set
            {
                this.cardsTopImage = value;
                this.NotifyPropertyChanged();
            }
        }

        /// <summary>
        /// Gets or sets the description of a product or a company.
        /// </summary>
        /// <value>The product description.</value>
        public string ProductDescription
        {
            get
            {
                return this.productDescription;
            }

            set
            {
                this.productDescription = value;
                this.NotifyPropertyChanged();
            }
        }

        /// <summary>
        /// Gets or sets the product icon.
        /// </summary>
        /// <value>The product icon.</value>
        public string ProductIcon
        {
            get
            {
                return this.productIcon;
            }

            set
            {
                this.productIcon = value;
                this.NotifyPropertyChanged();
            }
        }

        /// <summary>
        /// Gets or sets the product version.
        /// </summary>
        /// <value>The product version.</value>
        public string ProductVersion
        {
            get
            {
                return this.productVersion;
            }

            set
            {
                this.productVersion = value;
                this.NotifyPropertyChanged();
            }
        }

        /// <summary>
        /// Gets or sets the employee details.
        /// </summary>
        /// <value>The employee details.</value>
        public ObservableCollection<AboutUsModel> EmployeeDetails { get; set; }

        /// <summary>
        /// Gets or sets the command that will be executed when an item is selected.
        /// </summary>
        public Command ItemSelectedCommand { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Invoked when an item is selected.
        /// </summary>
        private void ItemSelected(object selectedItem)
        {
            // Do something
        }

        #endregion
    }
}