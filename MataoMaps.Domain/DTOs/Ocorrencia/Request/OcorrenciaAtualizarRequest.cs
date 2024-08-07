using MataoMaps.Domain.Enumerators;

namespace MataoMaps.Domain.DTOs.Ocorrencia.Request
{
    public class OcorrenciaAtualizarRequest
    {
        public Guid Id { get; set; }
        public string Descricao { get; set; }
        public EnumStatus Status { get; set; }
    }
}
