using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HelpTech.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddCodigoVerificacaoUsuario : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CriadoPorId",
                table: "TB_Usuario");

            migrationBuilder.DropColumn(
                name: "EhSuperAdmin",
                table: "TB_Usuario");

            migrationBuilder.AddColumn<string>(
                name: "CodigoVerificacao",
                table: "TB_Usuario",
                type: "varchar(6)",
                maxLength: 6,
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CodigoVerificacao",
                table: "TB_Usuario");

            migrationBuilder.AddColumn<Guid>(
                name: "CriadoPorId",
                table: "TB_Usuario",
                type: "char(36)",
                nullable: true,
                collation: "ascii_general_ci");

            migrationBuilder.AddColumn<bool>(
                name: "EhSuperAdmin",
                table: "TB_Usuario",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);
        }
    }
}
