using CocktailApp.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace CocktailApp.Helpers
{
    public class StorageHelper
    {
        public static ObservableCollection<Cocktail> CocktailsList = new ObservableCollection<Cocktail>();
        private static string filename = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "cocktail.txt");

        public static void SaveCocktails(List<Cocktail> cocktails)
        {
            var s = JsonConvert.SerializeObject(cocktails);
            File.WriteAllText(filename, s);
        }

        public async static Task GetCocktails(bool storage = false)
        {
            if (storage)
            {
                if (File.Exists(filename))
                {
                    var s = File.ReadAllText(filename);
                    CocktailsList = new ObservableCollection<Cocktail>(JsonConvert.DeserializeObject<List<Cocktail>>(s));
                    return;
                }
            }

            var uri = new Uri("https://borden.ch/cocktails.json");
            HttpClient myClient = new HttpClient();

            var response = await myClient.GetAsync(uri);
            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                var onlineList = JsonConvert.DeserializeObject<List<Cocktail>>(content);

                CocktailsList = new ObservableCollection<Cocktail>(Merge(CocktailsList.ToList(), onlineList));
            }
            else
                CocktailsList = new ObservableCollection<Cocktail>();
            SaveCocktails(CocktailsList.ToList());


        }

        /// <summary>
        /// Compare the local list with the online one and merge them with following rules:
        /// if item is not present on local list, add it,
        /// if item is not present on online list, remove it,
        /// if item is present on both list, update values with version number from online list
        /// </summary>
        /// <param name="local"></param>
        /// <param name="online"></param>
        /// <returns></returns>
        private static List<Cocktail> Merge(List<Cocktail> local, List<Cocktail> online)
        {
            List<Cocktail> MergedList = new List<Cocktail>();

            foreach(Cocktail cocktail in online)
            {
                if (local.Any(c => c.ID == cocktail.ID))//exists locally too
                {
                    Cocktail LocalCocktail = local.Where(c => c.ID == cocktail.ID).FirstOrDefault();
                    //Need to copy user preferences
                    cocktail.IsFavourite = LocalCocktail.IsFavourite;

                    if (LocalCocktail.Version < cocktail.Version)
                        MergedList.Add(cocktail);
                    else
                        MergedList.Add(LocalCocktail);
                }
                else//new one only from online
                    MergedList.Add(cocktail);
            }

            return MergedList;
        }
    }
}
