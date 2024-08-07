using System.ComponentModel;

namespace MataoMaps.Domain.Enumerators
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
