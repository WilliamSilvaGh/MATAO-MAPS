using MataoMaps.Domain.Enumerators;
using System.Text.Json.Serialization;

namespace MataoMaps.Domain.DTOs.Ocorrencia.Request
{
    public class OcorrenciaAdicionarRequest
    {
        public string? FotoBase64 { get; set; }
        public string Descricao { get; set; }
    }
}