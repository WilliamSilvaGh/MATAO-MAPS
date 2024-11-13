namespace MataoMaps.Presentation.Services
{
    public class DateService
    {
        // Retorna a lista de anos disponíveis a partir de um ano inicial até o ano atual.
        public List<int> GetAvailableYears(int startYear)
        {
            int currentYear = DateTime.Now.Year;
            return Enumerable.Range(startYear, currentYear - startYear + 1).ToList();
        }

        // Retorna a lista de meses como MonthItem.
        public List<MonthItem> GetMonths()
        {
            var months = new List<string>
        {
            "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
            "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
        };

            return months.Select((month, index) => new MonthItem
            {
                MonthNumber = index + 1,
                MonthName = month
            }).ToList();
        }

        // Retorna a lista de dias para um mês e ano específicos.
        public List<int> GetAvailableDays(int month, int year)
        {
            int daysInMonth = DateTime.DaysInMonth(year, month);
            return Enumerable.Range(1, daysInMonth).ToList();
        }
    }

    // Classe que representa um mês com seu número e nome.
    public class MonthItem
    {
        public int MonthNumber { get; set; }
        public string MonthName { get; set; }
    }
}
