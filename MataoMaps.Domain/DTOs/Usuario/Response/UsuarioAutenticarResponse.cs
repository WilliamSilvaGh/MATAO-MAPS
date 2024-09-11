namespace MataoMaps.Domain.DTOs.Usuario.Response
{
    public class UsuarioAutenticarResponse
    {
        public Guid Id { get; set; }
        public string Nome { get; set; }
        public string AccessToken { get; set; }

        public bool EhAdmin { get; set; }

        public UsuarioAutenticarResponse(
            Guid id,
            string nome,
            string accessToken,
            bool ehAdmin)
        {
            Id = id;
            Nome = nome;
            AccessToken = accessToken;
            EhAdmin = ehAdmin;
        }
    }
}
