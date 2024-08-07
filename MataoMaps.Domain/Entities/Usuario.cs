using MataoMaps.Domain.Entities.Base;
using System.Security.Claims;

namespace MataoMaps.Domain.Entities
{
    public class Usuario : EntityBase
    {
        public string Nome { get; private set; }
        public string EmailLogin { get; private set; }
        public string Senha { get; private set; }
        public bool EhAdmin { get; private set; }

        protected Usuario() { }

        public Usuario(string nome, string emailLogin, string senha, bool ehAdmin)
        {
            Nome = nome;
            EmailLogin = emailLogin;
            Senha = senha;
            EhAdmin = ehAdmin;
        }

        public void AlterarSenha(string senha)
        {
            Senha = senha;
        }

        public void AlterarVisibilidadeAdmin()
        {
            EhAdmin = !EhAdmin;
        }
    }
}
