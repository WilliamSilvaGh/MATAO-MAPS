using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HelpTech.Data.Migrations
{
    /// <inheritdoc />
    public partial class UpdadeinOcorrencia : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DataHora",
                table: "TB_Ocorrencia");

            migrationBuilder.AddColumn<DateOnly>(
                name: "Data",
                table: "TB_Ocorrencia",
                type: "date",
                nullable: false,
                defaultValue: new DateOnly(1, 1, 1));

            migrationBuilder.AddColumn<TimeOnly>(
                name: "Hora",
                table: "TB_Ocorrencia",
                type: "time(6)",
                nullable: false,
                defaultValue: new TimeOnly(0, 0, 0));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Data",
                table: "TB_Ocorrencia");

            migrationBuilder.DropColumn(
                name: "Hora",
                table: "TB_Ocorrencia");

            migrationBuilder.AddColumn<DateTime>(
                name: "DataHora",
                table: "TB_Ocorrencia",
                type: "datetime(6)",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }
    }
}
