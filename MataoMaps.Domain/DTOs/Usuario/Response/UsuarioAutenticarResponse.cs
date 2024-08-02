namespace HelpTech.Domain.DTOs.Usuario.Response
{
    public class UsuarioAutenticarResponse
    {
        public Guid Id { get; set; }
        public string Nome { get; set; }
        public string AccessToken { get; set; }

        public UsuarioAutenticarResponse(
            Guid id,
            string nome,
            string accessToken)
        {
            Id = id;
            Nome = nome;
            AccessToken = accessToken;
        }
    }
}
