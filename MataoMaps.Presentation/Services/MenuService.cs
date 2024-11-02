namespace MataoMaps.Presentation.Services
{
    public class MenuService
    {
        public event Action<bool> OnMenuToggle; // Evento para notificar mudanças no estado do menu

        private bool _isMenuOpen;

        public bool IsMenuOpen
        {
            get => _isMenuOpen;
            set
            {
                if (_isMenuOpen != value)
                {
                    _isMenuOpen = value;
                    OnMenuToggle?.Invoke(_isMenuOpen); // Notifica os inscritos sobre a mudança
                }
            }
        }
    }
}
