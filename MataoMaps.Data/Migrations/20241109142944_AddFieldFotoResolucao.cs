using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MataoMaps.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddFieldFotoResolucao : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "FotoResolucao",
                table: "TB_Ocorrencia",
                type: "longtext",
                nullable: false)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FotoResolucao",
                table: "TB_Ocorrencia");
        }
    }
}
