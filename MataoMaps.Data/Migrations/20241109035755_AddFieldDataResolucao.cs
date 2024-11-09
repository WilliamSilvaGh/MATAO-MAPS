using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MataoMaps.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddFieldDataResolucao : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateOnly>(
                name: "DataResolucao",
                table: "TB_Ocorrencia",
                type: "date",
                nullable: false,
                defaultValue: new DateOnly(1, 1, 1));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DataResolucao",
                table: "TB_Ocorrencia");
        }
    }
}
