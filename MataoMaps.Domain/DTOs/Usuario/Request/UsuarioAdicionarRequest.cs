namespace HelpTech.Domain.DTOs.Usuario.Request
{
    public class UsuarioAdicionarRequest
    {
        public string Nome { get; set; }
        public string EmailLogin { get; set; }
        public string EmailLoginConfirmacao { get; set; }
        public string Senha { get; set; }
        public string SenhaConfirmacao { get; set; }
        public bool EhAdmin { get; set; }
    }
}
