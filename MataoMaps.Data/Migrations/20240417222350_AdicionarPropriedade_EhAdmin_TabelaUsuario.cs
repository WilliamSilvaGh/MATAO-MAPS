using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HelpTech.Data.Migrations
{
    /// <inheritdoc />
    public partial class AdicionarPropriedade_EhAdmin_TabelaUsuario : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "EhAdmin",
                table: "TB_Usuario",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EhAdmin",
                table: "TB_Usuario");
        }
    }
}
