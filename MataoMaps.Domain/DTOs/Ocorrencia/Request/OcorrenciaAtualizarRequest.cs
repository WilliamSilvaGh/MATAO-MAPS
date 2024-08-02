using HelpTech.Domain.Enumerators;
using System.Text.Json.Serialization;

namespace HelpTech.Domain.DTOs.Ocorrencia.Request
{
    public class OcorrenciaAtualizarRequest
    {
        public Guid Id { get; set; }

        //[JsonConverter(typeof(JsonStringEnumConverter))]
        public EnumTipoOcorrencia TipoOcorrencia { get; set; }
        public string Descricao { get; set; }

        //[JsonConverter(typeof(JsonStringEnumConverter))]
        public EnumStatus Status { get; set; }
    }
}
