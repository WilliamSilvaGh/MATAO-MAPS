namespace HelpTech.Domain.DTOs.Usuario.Response
{
    public class UsuarioListarResponse
    {
        public Guid Id { get; set; }
        public string Nome { get; set; }
        public bool EhAdmin { get; set;}
    }
}
