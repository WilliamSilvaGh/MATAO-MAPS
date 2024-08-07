using MataoMaps.Domain.Entities.Base;
using MataoMaps.Domain.Enumerators;
using System.ComponentModel.DataAnnotations.Schema;

namespace MataoMaps.Domain.Entities
{
    public class Ocorrencia : EntityBase
    {
        public string FotoBase64 { get; set; }
        public string Descricao { get; set; }

        [Column(TypeName = "varchar(15)")]
        public EnumStatus Status { get; set; }
        public string Resolucao { get; set; }
        public Guid UsuarioId { get; set; }
        public Guid? UsuarioResolucaoId { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario UsuarioResolucao { get; set; }

        protected Ocorrencia() {}

        public Ocorrencia(
            string? fotoBase64,
            string descricao,
            Guid usuarioId)
        {
            Id = Guid.NewGuid();
            FotoBase64 = fotoBase64;
            Descricao = descricao;
            Status = EnumStatus.AFazer;
            UsuarioId = usuarioId;
        }

        public void Atualizar(string descricao)
        {
            Descricao = descricao;
        }

        public void Atualizar(string descricao, EnumStatus status)
        {
            Descricao = descricao;
            Status = status;
        }

        public void IniciarAtendimento()
        {
            Status = EnumStatus.EmAndamento;
        }

        public void Encerrar(string resolucao, Guid usuarioResolucaoId)
        {
            Resolucao = resolucao;
            UsuarioResolucaoId = usuarioResolucaoId;
            Status = EnumStatus.Concluido;
        }
    }
}
