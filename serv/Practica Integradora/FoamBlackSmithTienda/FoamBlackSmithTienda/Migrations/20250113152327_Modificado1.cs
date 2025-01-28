using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FoamBlackSmithTienda.Migrations
{
    /// <inheritdoc />
    public partial class Modificado1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SubCategoriaId",
                table: "Categorias");

            migrationBuilder.RenameColumn(
                name: "Descripcion",
                table: "Categorias",
                newName: "Nombre");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Nombre",
                table: "Categorias",
                newName: "Descripcion");

            migrationBuilder.AddColumn<int>(
                name: "SubCategoriaId",
                table: "Categorias",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
