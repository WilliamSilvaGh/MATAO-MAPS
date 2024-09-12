using MataoMaps.Domain.Enumerators;
using System.Text.Json.Serialization;

namespace MataoMaps.Domain.DTOs.Ocorrencia.Request
{
    public class OcorrenciaAdicionarRequest
    {
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public byte[] Imagem { get; set; }
        public string Endereco { get; set; }
        public string Descricao { get; set; }
    }
}