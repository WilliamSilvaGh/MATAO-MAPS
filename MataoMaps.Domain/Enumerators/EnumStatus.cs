using System.ComponentModel;

namespace HelpTech.Domain.Enumerators
{
    public enum EnumStatus
    {
        [Description("A Fazer")]
        AFazer,

        [Description("Em Andamento")]
        EmAndamento,

        [Description("Concluído")]
        Concluido
    }
}
