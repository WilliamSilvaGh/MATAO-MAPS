using System.ComponentModel;
using System.Text.Json.Serialization;
using System.Text.Json;

namespace MataoMaps.Domain.Enumerators
{
    public enum EnumStatus
    {
        [Description("Fazer")]
        Fazer,

        [Description("Em Andamento")]
        EmAndamento,

        [Description("Concluído")]
        Concluido
    }

    public class EnumStatusConverter : JsonConverter<EnumStatus>
    {
        public override EnumStatus Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            var enumString = reader.GetString();
            if (Enum.TryParse<EnumStatus>(enumString, true, out var result))
            {
                return result;
            }
            throw new JsonException($"Valor desconhecido para EnumStatus: {enumString}");
        }

        public override void Write(Utf8JsonWriter writer, EnumStatus value, JsonSerializerOptions options)
        {
            writer.WriteStringValue(value.ToString());
        }
    }

}
