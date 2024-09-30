namespace MataoMaps.Presentation.Services
{
    public class BackgroundColorService
    {
        public string BackgroundColor { get; private set; } = "#FFFFFF";

        public event Action OnBackgroundColorChanged;
        public void SetBackgroundColor(string color)
        {
            BackgroundColor = color;
            OnBackgroundColorChanged?.Invoke();
        }
    }
}
