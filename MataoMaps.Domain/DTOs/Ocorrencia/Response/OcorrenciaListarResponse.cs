using MataoMaps.Domain.Enumerators;
using System.Text.Json.Serialization;

namespace MataoMaps.Domain.DTOs.Ocorrencia.Response
{
    public class OcorrenciaListarResponse
    {
        public Guid Id { get; set; }  
        public string UsuarioNome { get; set; }
        public string? FotoBase64 { get; set; }

        [JsonConverter(typeof(JsonStringEnumConverter))]
        public string Descricao { get; set; }
        public string Resolucao { get; set; }

        [JsonConverter(typeof(JsonStringEnumConverter))]
        public EnumStatus Status {  get; set; }
    }
}
