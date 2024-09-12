using MataoMaps.Domain.Entities.Base;
using MataoMaps.Domain.Enumerators;

namespace MataoMaps.Domain.Entities
{
    public class Ocorrencia : EntityBase
    {
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public byte[] Imagem { get; set; }
        public string Endereco { get; set; }
        public string Descricao { get; set; }
        public EnumStatus Status { get; set; }
        public string Resolucao { get; set; }
        public Guid UsuarioId { get; set; }
        public Guid? UsuarioResolucaoId { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario UsuarioResolucao { get; set; }

        protected Ocorrencia() {}

        public Ocorrencia(
            decimal latitude,
            decimal longitude,
            byte[] imagem,
            string endereco,
            string descricao,
            Guid usuarioId)
        {
            Id = Guid.NewGuid();
            Latitude = latitude;
            Longitude = longitude;
            Imagem = imagem;
            Endereco = endereco;
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
