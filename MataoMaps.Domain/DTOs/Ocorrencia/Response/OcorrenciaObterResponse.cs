using HelpTech.Domain.Enumerators;

namespace HelpTech.Domain.DTOs.Ocorrencia.Response
{
    public class OcorrenciaObterResponse
    {
        public Guid Id { get; set; }
        public Guid UsuarioId { get; set; }
        public EnumTipoOcorrencia TipoOcorrencia { get; set; }
        public DateOnly Data { get; set; }
        public TimeOnly Hora { get; set; }
        public string Descricao { get; set; }
        public string DescricaoResolucao { get; set; }
        public EnumStatus Status { get; set; }
    }
}
