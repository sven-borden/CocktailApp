using CocktailApp.Models;
using CocktailApp.Views.CocktailDetail;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

        #endregion

        #region Constructor
        /// <summary>
        /// Initializes a new instance for the <see cref="ArticleListViewModel" /> class.
        /// </summary>
        public ArticleListViewModel()
        {
            this.FeaturedStories = new ObservableCollection<Cocktail>
            {
                //espresso martini
                new Cocktail
                {
                    ImagePath = "https://images.absolutdrinks.com/drink-images/Raw/Absolut/f49cbade-4493-469e-bfde-ef4268f0c0e0.jpg?imwidth=750",
                    PreviewImages = new List<string>()
                    {
                        "https://images.absolutdrinks.com/drink-images/Raw/Absolut/f49cbade-4493-469e-bfde-ef4268f0c0e0.jpg?imwidth=750",
                    },
                    Name = "Espresso Martini",
                    Description = "The famous Espresso Martini is a top drink and a classic Kahlua cocktail. Invented by the famous late bartender Dick Bradsell, as a peculiar request from a British top model in his London bar in 1983. The Espresso Martini is a cocktail with a story, a history and a legacy.",
                    Tag = "Coffee",
                    Alcohol = 0.15,
                    Recipe = new Recipe()
                    {
                        RecipeList = new List<Ingredient>()
                        {
                            new Ingredient(){Name = "Vodka", Quantity = 1.3},
                            new Ingredient(){Name = "Kahlua", Quantity = 0.66},
                            new Ingredient(){Name = "Espresso", Quantity = 0.66},
                            new Ingredient(){Name = "Coffee Beans", Quantity = 3}
                        }
                    }
                },
                new Cocktail
                {
                    ImagePath = "http://www.denied-cocktails.com/wp-content/uploads/2017/08/The-Blue-Train-Cocktail_5_1-668x1024.jpg",
                    PreviewImages = new List<string>()
                    {
                        "http://www.denied-cocktails.com/wp-content/uploads/2017/08/The-Blue-Train-Cocktail_5_1-668x1024.jpg",
                    },
                    Name = "Blue Train",
                    Description = "We were surprised to find that this drink probably predates blue curaçao! Famed bartender Harry Craddock used a “blue vegetable extract” along with Cointreau triple sec to create the effect.",
                    Tag = "Blue",
                    Alcohol = 0.3,
                    Recipe = new Recipe()
                    {
                        RecipeList = new List<Ingredient>()
                        {
                            new Ingredient(){Name = "Vodka/Gin", Quantity = 1.5},
                            new Ingredient(){Name = "Triple Sec", Quantity = 0.75},
                            new Ingredient(){Name = "Blue Curaçao", Quantity = 0.5},
                            new Ingredient(){Name = "Lemon juice", Quantity = 0.66},
                            new Ingredient(){Name = "Lemon zest", Quantity = 1}
                        }
                    }
                }
            };

            this.LatestStories = new ObservableCollection<Cocktail>
            {
                new Cocktail
                {
                    ImagePath = "https://images.absolutdrinks.com/drink-images/Raw/Absolut/244d2569-6d4f-4b31-acf4-513d6c85113a.jpg?imwidth=750",
                    PreviewImages = new List<string>()
                    {
                        "https://images.absolutdrinks.com/drink-images/Raw/Absolut/244d2569-6d4f-4b31-acf4-513d6c85113a.jpg?imwidth=750",
                    },
                    Name = "Classic Martini",
                    Description = "The martini is a cocktail made with gin or vodka and vermouth, and garnished with an olive or a lemon twist. Over the years, the martini has become one of the best-known mixed alcoholic beverages.",
                    Tag = "Classic",
                    Alcohol = 0.3,
                    Recipe = new Recipe()
                    {
                        RecipeList = new List<Ingredient>()
                        {
                            new Ingredient(){Name = "Gin/Vodka", Quantity = 1.5},
                            new Ingredient(){Name = "Dry Vermouth", Quantity = 0.2},
                            new Ingredient(){Name = "Lemon zest", Quantity = 1},
                            new Ingredient(){Name = "Green Olive", Quantity = 1}
                        }
                    }
                },
                new Cocktail
                {
                    ImagePath = "https://images.absolutdrinks.com/drink-images/Raw/Absolut/4416545f-9d35-4c12-9f24-8892d668321b.jpg?imwidth=750",
                    PreviewImages = new List<string>()
                    {
                        "https://images.absolutdrinks.com/drink-images/Raw/Absolut/4416545f-9d35-4c12-9f24-8892d668321b.jpg?imwidth=750",
                    },
                    Name = "French 75",
                    Description = "The drink was created in 1915 at the New York Bar in Paris - later Harry's New York Bar - by barman Harry MacElhone. The combination was said to have such a kick that it felt like being shelled with the powerful French 75mm field gun, also called a 75 Cocktail, or Soixante Quinze in French. The French 75 was popularized in America at the Stork Club in New York.",
                    Tag = "Champagne",
                    Alcohol = 0.13,
                    Recipe = new Recipe()
                    {
                        RecipeList = new List<Ingredient>()
                        {
                            new Ingredient(){Name = "Gin", Quantity = 1},
                            new Ingredient(){Name = "Lemon juice", Quantity = 0.5},
                            new Ingredient(){Name = "Simple syrup", Quantity = 0.5},
                            new Ingredient(){Name = "Champgne"},
                            new Ingredient(){Name = "Lemon Zest"}
                        }
                    }
                },
                new Cocktail
                {
                    ImagePath = "http://www.denied-cocktails.com/wp-content/uploads/2017/08/The-Blue-Train-Cocktail_5_1-668x1024.jpg",
                    PreviewImages = new List<string>()
                    {
                        "http://www.denied-cocktails.com/wp-content/uploads/2017/08/The-Blue-Train-Cocktail_5_1-668x1024.jpg",
                    },
                    Name = "Blue Train",
                    Description = "We were surprised to find that this drink probably predates blue curaçao! Famed bartender Harry Craddock used a “blue vegetable extract” along with Cointreau triple sec to create the effect.",
                    Tag = "Blue",
                    Alcohol = 0.3,
                    Recipe = new Recipe()
                    {
                        RecipeList = new List<Ingredient>()
                        {
                            new Ingredient(){Name = "Vodka/Gin", Quantity = 1.5},
                            new Ingredient(){Name = "Triple Sec", Quantity = 0.75},
                            new Ingredient(){Name = "Blue Curaçao", Quantity = 0.5},
                            new Ingredient(){Name = "Lemon juice", Quantity = 0.66},
                            new Ingredient(){Name = "Lemon zest", Quantity = 1}
                        }
                    }
                },
                new Cocktail
                {
                    ImagePath = "https://images.absolutdrinks.com/drink-images/Raw/Absolut/f49cbade-4493-469e-bfde-ef4268f0c0e0.jpg?imwidth=750",
                    PreviewImages = new List<string>()
                    {
                        "https://images.absolutdrinks.com/drink-images/Raw/Absolut/f49cbade-4493-469e-bfde-ef4268f0c0e0.jpg?imwidth=750",
                    },
                    Name = "Espresso Martini",
                    Description = "The famous Espresso Martini is a top drink and a classic Kahlua cocktail. Invented by the famous late bartender Dick Bradsell, as a peculiar request from a British top model in his London bar in 1983. The Espresso Martini is a cocktail with a story, a history and a legacy.",
                    Tag = "Coffee",
                    Alcohol = 0.15,
                    Recipe = new Recipe()
                    {
                        RecipeList = new List<Ingredient>()
                        {
                            new Ingredient(){Name = "Vodka", Quantity = 1.3},
                            new Ingredient(){Name = "Kahlua", Quantity = 0.66},
                            new Ingredient(){Name = "Espresso", Quantity = 0.66},
                            new Ingredient(){Name = "Coffee Beans", Quantity = 3}
                        }
                    }
                }
            };

            this.MenuCommand = new Command(this.MenuClicked);
            this.BookmarkCommand = new Command(this.BookmarkButtonClicked);
            this.FeatureStoriesCommand = new Command(this.FeatureStoriesClicked);
            this.ItemSelectedCommand = new Command(this.ItemSelected);
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
            await Application.Current.MainPage.Navigation.PushAsync(new CocktailBookingPage());
        }

        /// <summary>
        /// Invoked when an item is selected.
        /// </summary>
        /// <param name="obj">The Object</param>
        private async void ItemSelected(object obj)
        {
            await Application.Current.MainPage.Navigation.PushAsync(new CocktailBookingPage());
        }

        #endregion
    }
}
