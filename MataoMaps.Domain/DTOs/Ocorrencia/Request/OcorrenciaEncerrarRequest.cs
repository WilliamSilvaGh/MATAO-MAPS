namespace MataoMaps.Domain.DTOs.Ocorrencia.Request
{
    public class OcorrenciaEncerrarRequest
    {
        public Guid Id { get; set; }
        public DateOnly DataResolucao { get; set; }
        public string FotoResolucao { get; set; }
        public string Resolucao { get; set; }
    }
}
