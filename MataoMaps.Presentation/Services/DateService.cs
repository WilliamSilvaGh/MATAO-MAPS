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
            // Se o mês ou ano forem 0, simplesmente retorna uma lista vazia.
            if (month == 0 || year == 0)
            {
                return new List<int>();  // Não há dias disponíveis sem um mês e ano válidos
            }

            // Verifica se o mês é válido (entre 1 e 12) e o ano também é válido
            if (month < 1 || month > 12 || year < 1)
            {
                return new List<int>();  // Retorna uma lista vazia caso os parâmetros sejam inválidos
            }

            // Retorna a lista de dias válidos para o mês e ano fornecidos
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