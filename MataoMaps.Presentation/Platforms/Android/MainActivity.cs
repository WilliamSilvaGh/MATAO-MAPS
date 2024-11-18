using Android.App;
using Android.Content.PM;
using Android.OS;
using Android.Views;

namespace MataoMaps.Presentation
{
    [Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
    public class MainActivity : MauiAppCompatActivity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Configurar o modo de ajuste do teclado
            Window.SetSoftInputMode(SoftInput.AdjustResize);
        }
    }
}
