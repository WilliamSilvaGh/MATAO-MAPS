﻿using MataoMaps.Domain.Enumerators;

namespace MataoMaps.Domain.DTOs.Ocorrencia.Response
{
    public class OcorrenciaObterResponse
    {
        public Guid Id { get; set; }
        public Guid UsuarioId { get; set; }
        public DateOnly Data { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string FotoBase64 { get; set; }
        public string Endereco { get; set; }
        public string Descricao { get; set; }
        public DateOnly DataResolucao { get; set; }
        public string FotoResolucao { get; set; }
        public string Resolucao { get; set; }
        public EnumStatus Status { get; set; }
    }
}
