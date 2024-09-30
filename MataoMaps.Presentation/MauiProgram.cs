﻿using MataoMaps.Presentation.Services;
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
            builder.Services.AddScoped(httpClient => new HttpClient
            {
                BaseAddress = new Uri("https://localhost:7153/")
                //BaseAddress = new Uri("https://helptech-api.tccnapratica.com.br")
            });
            builder.Services.AddScoped<DialogService>();
            builder.Services.AddScoped<NotificationService>();
            builder.Services.AddSingleton<PageTitleService>();
            builder.Services.AddSingleton<BackgroundColorService>();
            builder.Services.AddScoped<UsuarioLogadoService>();

#if DEBUG
            builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
