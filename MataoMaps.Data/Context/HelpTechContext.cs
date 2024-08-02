using HelpTech.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace HelpTech.Data.Context
{
    public class HelpTechContext : DbContext
    {
        public DbSet<Ocorrencia> OcorrenciaSet { get; set; }
        public DbSet<Usuario> UsuarioSet { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

            base.OnModelCreating(modelBuilder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            const string conexao = "server=mysql.tccnapratica.com.br;database=tccnapratica05;port=3306;uid=tccnapratica05;password=a05C80";
            optionsBuilder.UseMySql(conexao, ServerVersion.AutoDetect(conexao));
            base.OnConfiguring(optionsBuilder);
        }
    }
}
