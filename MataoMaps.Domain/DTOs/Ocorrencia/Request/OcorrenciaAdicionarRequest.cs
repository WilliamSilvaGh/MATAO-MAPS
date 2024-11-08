namespace MataoMaps.Domain.DTOs.Ocorrencia.Request
{
    public class OcorrenciaAdicionarRequest
    {
        public DateOnly Data { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string FotoBase64 { get; set; }
        public string Endereco { get; set; }
        public string Descricao { get; set; }
    }

}