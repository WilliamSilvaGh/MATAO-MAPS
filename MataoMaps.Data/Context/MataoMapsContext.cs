using MataoMaps.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace MataoMaps.Data.Context
{
    public class MataoMapsContext : DbContext
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
                const string conexao = "server=mysql.tccnapratica.com.br;database=tccnapratica07;port=3306;uid=tccnapratica07;password=Wil1708liam";
                optionsBuilder.UseMySql(conexao, ServerVersion.AutoDetect(conexao));
                base.OnConfiguring(optionsBuilder);
            }
        }
    }
