using MataoMaps.Domain.Entities.Base;
using MataoMaps.Domain.Enumerators;

namespace MataoMaps.Domain.Entities
{
    public class Ocorrencia : EntityBase
    {
        public DateOnly Data { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string FotoBase64 { get; set; }
        public string Endereco { get; set; }
        public string Descricao { get; set; }
        public EnumStatus Status { get; set; }
        public string Resolucao { get; set; }
        public Guid UsuarioId { get; set; }
        public Guid? UsuarioResolucaoId { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario UsuarioResolucao { get; set; }

        protected Ocorrencia() { }

        public Ocorrencia(
            DateOnly data,
            double latitude,
            double longitude,
            string fotoBase64,
            string endereco,
            string descricao,
            Guid usuarioId)
        {
            Id = Guid.NewGuid();
            Data = data;
            Latitude = latitude;
            Longitude = longitude;
            FotoBase64 = fotoBase64;
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
