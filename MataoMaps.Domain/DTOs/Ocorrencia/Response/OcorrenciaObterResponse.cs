using MataoMaps.Domain.Enumerators;

namespace MataoMaps.Domain.DTOs.Ocorrencia.Response
{
    public class OcorrenciaObterResponse
    {
        public Guid Id { get; set; }
        public Guid UsuarioId { get; set; }
        public string? FotoBase64 { get; set; }
        public string Descricao { get; set; }
        public string Resolucao { get; set; }
        public EnumStatus Status { get; set; }
    }
}
