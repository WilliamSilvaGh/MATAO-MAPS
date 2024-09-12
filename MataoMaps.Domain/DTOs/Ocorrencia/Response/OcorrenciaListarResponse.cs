using MataoMaps.Domain.Enumerators;
using System.Text.Json.Serialization;

namespace MataoMaps.Domain.DTOs.Ocorrencia.Response
{
    public class OcorrenciaListarResponse
    {
        public Guid Id { get; set; }  
        public string UsuarioNome { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public byte[] Imagem { get; set; }
        public string Endereco { get; set; }
        public string Descricao { get; set; }
        public string Resolucao { get; set; }
        public EnumStatus Status {  get; set; }
    }
}
