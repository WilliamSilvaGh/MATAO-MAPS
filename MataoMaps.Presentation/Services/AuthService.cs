namespace MataoMaps.Presentation.Services
{
    public class AuthService
    {
        public event Action OnLogin;
        public event Action OnLogout;

        public void TriggerLoggedIn()
        {
            OnLogin?.Invoke();
        }

        public void TriggerLoggedOut()
        {
            OnLogout?.Invoke();
        }
    }
}
