using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FoamBlackSmithTienda.Migrations
{
    /// <inheritdoc />
    public partial class Modificado2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SubCategoria",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubCategoria", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CategoriaSubCategoria",
                columns: table => new
                {
                    CategoriasId = table.Column<int>(type: "int", nullable: false),
                    subCategoriasId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CategoriaSubCategoria", x => new { x.CategoriasId, x.subCategoriasId });
                    table.ForeignKey(
                        name: "FK_CategoriaSubCategoria_Categorias_CategoriasId",
                        column: x => x.CategoriasId,
                        principalTable: "Categorias",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CategoriaSubCategoria_SubCategoria_subCategoriasId",
                        column: x => x.subCategoriasId,
                        principalTable: "SubCategoria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CategoriaSubCategoria_subCategoriasId",
                table: "CategoriaSubCategoria",
                column: "subCategoriasId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CategoriaSubCategoria");

            migrationBuilder.DropTable(
                name: "SubCategoria");
        }
    }
}
