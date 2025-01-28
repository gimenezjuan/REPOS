using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FoamBlackSmithTienda.Migrations
{
    /// <inheritdoc />
    public partial class Modificado : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categorias_Categorias_CategoriaId",
                table: "Categorias");

            migrationBuilder.DropIndex(
                name: "IX_Categorias_CategoriaId",
                table: "Categorias");

            migrationBuilder.RenameColumn(
                name: "CategoriaId",
                table: "Categorias",
                newName: "SubCategoriaId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "SubCategoriaId",
                table: "Categorias",
                newName: "CategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_Categorias_CategoriaId",
                table: "Categorias",
                column: "CategoriaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categorias_Categorias_CategoriaId",
                table: "Categorias",
                column: "CategoriaId",
                principalTable: "Categorias",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
