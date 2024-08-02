using HelpTech.Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace HelpTech.Data.Configuration
{
    internal class UsuarioConfiguration :
        IEntityTypeConfiguration<Usuario>
    {
        public void Configure(EntityTypeBuilder<Usuario> builder)
        {
            builder.HasKey(p => p.Id);

            builder.Property(p => p.Nome)
                .HasMaxLength(200)
                .IsRequired();

            builder.Property(p => p.EmailLogin)
                .HasMaxLength(200)
                .IsRequired();

            builder.Property(p => p.Senha)
                .HasMaxLength(2000)
                .IsRequired();

            builder.Property(p => p.EhAdmin)
                .IsRequired();

            builder.ToTable("TB_Usuario");
        }

    }
}
