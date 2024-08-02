namespace HelpTech.Domain.DTOs.Usuario.Response
{
    public class UsuarioObterResponse
    {
        public Guid Id { get; set; }
        public string Nome { get; set; }
        public string EmailLogin { get; set; }
        public bool EhAdmin { get; set; }
    }
}
