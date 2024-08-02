namespace HelpTech.Domain.DTOs.Usuario.Request
{
    public class UsuarioAtualizarRequest
    {
        public Guid Id { get; set; }
        public Guid UsuarioId { get; set; }
        public string SenhaAtual { get; set; }
        public string SenhaNova { get; set; }

    }
}
