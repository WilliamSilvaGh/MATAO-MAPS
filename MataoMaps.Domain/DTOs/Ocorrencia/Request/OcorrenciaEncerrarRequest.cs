namespace MataoMaps.Domain.DTOs.Ocorrencia.Request
{
    public class OcorrenciaEncerrarRequest
    {
        public Guid Id { get; set; }
        public string Resolucao { get; set; }
        public DateOnly DataResolucao { get; set; }
    }
}
