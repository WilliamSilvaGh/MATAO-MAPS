namespace MataoMaps.Presentation.Services
{
    public class PageTitleService
    {
        public string PageTitle { get; private set; } = "OCORRÊNCIAS";

        public event Action OnTitleChanged;
        public void SetPageTitle(string title)
        {
            PageTitle = title;
            OnTitleChanged?.Invoke();
        }
    }
}
