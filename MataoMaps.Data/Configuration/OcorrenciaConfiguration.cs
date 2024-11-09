using MataoMaps.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace MataoMaps.Data.Configuration
{
    public class OcorrenciaConfiguration :
        IEntityTypeConfiguration<Ocorrencia>
    {
        public void Configure(EntityTypeBuilder<Ocorrencia> builder)
        {
            builder.HasKey(p => p.Id);

            builder.Property(p => p.Data)
                .IsRequired();

            builder.Property(P => P.Latitude)
                .IsRequired();

            builder.Property(P => P.Longitude)
                .IsRequired();

            builder.Property(p => p.FotoBase64)
                .HasColumnType("longtext");

            builder.Property(p => p.Endereco)
                .HasMaxLength(1000)
                .IsRequired();

            builder.Property(p => p.Descricao)
                .HasMaxLength(1000)
                .IsRequired();

            builder.Property(p => p.Status)
                .IsRequired();

            builder.Property(p => p.Resolucao)
                .HasMaxLength(1000)
                .IsRequired(false);

            builder.Property(p => p.DataResolucao)
                .IsRequired();

            builder.Property(p => p.UsuarioId)
                .IsRequired();

            builder.Property(p => p.UsuarioResolucaoId)
                .IsRequired(false);

            builder.ToTable("TB_Ocorrencia");
        }
    }
}