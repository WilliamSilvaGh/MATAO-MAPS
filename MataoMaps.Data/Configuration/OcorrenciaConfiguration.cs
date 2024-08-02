using HelpTech.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace HelpTech.Data.Configuration
{
    public class OcorrenciaConfiguration :
        IEntityTypeConfiguration<Ocorrencia>
    {
        public void Configure(EntityTypeBuilder<Ocorrencia> builder)
        {
            builder.HasKey(p => p.Id);

            builder.Property(p => p.Descricao)
                .HasMaxLength(1000)
                .IsRequired();

            builder.Property(p => p.TipoOcorrencia)
                .IsRequired();

            builder.Property(p => p.Data)
                .IsRequired();

            builder.Property(p => p.Hora)
                .IsRequired();

            builder.Property(p => p.Status)
                .IsRequired();

            builder.Property(p => p.DescricaoResolucao)
                .HasMaxLength(1000)
                .IsRequired(false);

            builder.Property(p => p.UsuarioId)
                .IsRequired();

            builder.Property(p => p.UsuarioResolucaoId)
                .IsRequired(false);

            builder.ToTable("TB_Ocorrencia");
        }
    }
}