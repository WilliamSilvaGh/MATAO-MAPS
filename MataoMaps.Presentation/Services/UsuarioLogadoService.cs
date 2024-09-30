namespace MataoMaps.Presentation.Services
{
    public class UsuarioLogadoService
    {
        public bool EhAdmin { get; set; }
        public bool IsLogged { get; set; }

        //public event Action OnUserChanged;
        //public void SetUser(bool ehAdmin, bool isLogged)
        //{
        //    EhAdmin = ehAdmin;
        //    IsLogged = isLogged;
        //    OnUserChanged?.Invoke();
        //}

    }
}
