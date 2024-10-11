namespace MataoMaps.Domain.DTOs.Ocorrencia.Request
{
    public class OcorrenciaAdicionarRequest
    {
        public DateOnly Data { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public string FotoBase64 { get; set; }
        public string Endereco { get; set; }
        public string Descricao { get; set; }
    }

}