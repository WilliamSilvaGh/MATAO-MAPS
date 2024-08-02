using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace HelpTech.CrossCutting
{
    public static class SetupJWT
    {
        public static void ConfigureAuthentication(this IServiceCollection services)
        {
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = "help.tech",
                        ValidAudience = "help.tech",
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("{469e8343-8fa6-42b9-9553-2f6e182c21fa}"))
                    };
                });
        }
    }
}
