using CocktailApp.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Net.Http;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace CocktailApp.Helpers
{
    public class StorageHelper
    {
        public static ObservableCollection<Cocktail> CocktailsList;
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
                CocktailsList = new ObservableCollection<Cocktail>(JsonConvert.DeserializeObject<List<Cocktail>>(content));
            }
            else
                CocktailsList = new ObservableCollection<Cocktail>();
            
        }
    }
}
