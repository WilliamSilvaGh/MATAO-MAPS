using MataoMaps.Presentation.Services;
using Microsoft.Extensions.Logging;
using Radzen;

namespace MataoMaps.Presentation
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            builder.Services.AddMauiBlazorWebView();

            //"http://10.0.2.2:5033" -> para emuladores Android
            //5033 -> porta http
            //7153 -> porta https e http

            var baseAddress = Device.RuntimePlatform == Device.Android
                ? "http://10.0.2.2:5033"
                : "http://localhost:5033";

            builder.Services.AddScoped(sp => new HttpClient
            {
                BaseAddress = new Uri(baseAddress)
            });

            builder.Services.AddScoped<DialogService>();
            builder.Services.AddScoped<NotificationService>();
            builder.Services.AddSingleton<PageTitleService>();
            builder.Services.AddSingleton<BackgroundColorService>();
            builder.Services.AddScoped<UsuarioLogadoService>();
            builder.Services.AddScoped<MenuService>();
            builder.Services.AddSingleton<DateService>();

#if DEBUG
            builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
