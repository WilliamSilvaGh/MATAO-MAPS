using HelpTech.Domain.Entities.Base;
using HelpTech.Domain.Enumerators;
using System.ComponentModel.DataAnnotations.Schema;

namespace HelpTech.Domain.Entities
{
    public class Ocorrencia : EntityBase
    {
        public string Descricao { get; set; }

        [Column(TypeName = "varchar(15)")]
        public EnumTipoOcorrencia TipoOcorrencia { get; set; }
        public DateOnly Data { get; set; }
        public TimeOnly Hora { get; set; }

        [Column(TypeName = "varchar(15)")]
        public EnumStatus Status { get; set; }
        public string DescricaoResolucao { get; set; }
        public Guid UsuarioId { get; set; }
        public Guid? UsuarioResolucaoId { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario UsuarioResolucao { get; set; }

        protected Ocorrencia() {}

        public Ocorrencia(
            string descricao,
            EnumTipoOcorrencia tipoOcorrencia,
            DateOnly dataHora,
            TimeOnly hora,
            Guid usuarioId)
        {
            Id = Guid.NewGuid();
            Descricao = descricao;
            TipoOcorrencia = tipoOcorrencia;
            Data = dataHora;
            Hora = hora;
            Status = EnumStatus.AFazer;
            UsuarioId = usuarioId;
        }

        public void Atualizar(string descricao, EnumTipoOcorrencia tipoOcorrencia)
        {
            Descricao = descricao;
            TipoOcorrencia = tipoOcorrencia;
        }

        public void Atualizar(string descricao, EnumTipoOcorrencia tipoOcorrencia, EnumStatus status)
        {
            Descricao = descricao;
            TipoOcorrencia = tipoOcorrencia;
            Status = status;
        }

        public void IniciarAtendimento()
        {
            Status = EnumStatus.EmAndamento;
        }

        public void Encerrar(string descricaoResolucao, Guid usuarioResolucaoId)
        {
            DescricaoResolucao = descricaoResolucao;
            UsuarioResolucaoId = usuarioResolucaoId;
            Status = EnumStatus.Concluido;
        }
    }
}
