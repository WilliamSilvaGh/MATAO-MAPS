using HelpTech.Domain.Enumerators;
using System.Text.Json.Serialization;

namespace HelpTech.Domain.DTOs.Ocorrencia.Response
{
    public class OcorrenciaListarResponse
    {
        public Guid Id { get; set; }  
        public string UsuarioNome { get; set; }

        [JsonConverter(typeof(JsonStringEnumConverter))]
        public EnumTipoOcorrencia TipoOcorrencia { get; set; }
        public DateOnly Data { get; set; }
        public TimeOnly Hora { get; set; }
        public string Descricao { get; set; }
        public string DescricaoResolucao { get; set; }

        [JsonConverter(typeof(JsonStringEnumConverter))]
        public EnumStatus Status {  get; set; }
    }
}
