using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MataoMaps.Data.Migrations
{
    /// <inheritdoc />
    public partial class AlterPositionFieldFotoResolucao : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "FotoResolucao",
                table: "TB_Ocorrencia",
                type: "longtext",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "longtext")
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "TB_Ocorrencia",
                keyColumn: "FotoResolucao",
                keyValue: null,
                column: "FotoResolucao",
                value: "");

            migrationBuilder.AlterColumn<string>(
                name: "FotoResolucao",
                table: "TB_Ocorrencia",
                type: "longtext",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "longtext",
                oldNullable: true)
                .Annotation("MySql:CharSet", "utf8mb4")
                .OldAnnotation("MySql:CharSet", "utf8mb4");
        }
    }
}
