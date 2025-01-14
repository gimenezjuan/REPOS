using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FoamBlackSmithTienda.Migrations
{
    /// <inheritdoc />
    public partial class Migracion4 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CategoriaSubCategoria");

            migrationBuilder.AlterColumn<bool>(
                name: "Escaparte",
                table: "Productos",
                type: "bit",
                nullable: false,
                defaultValue: false,
                oldClrType: typeof(bool),
                oldType: "bit",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SubcategoriaId",
                table: "Productos",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Productos_SubcategoriaId",
                table: "Productos",
                column: "SubcategoriaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Productos_SubCategoria_SubcategoriaId",
                table: "Productos",
                column: "SubcategoriaId",
                principalTable: "SubCategoria",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Productos_SubCategoria_SubcategoriaId",
                table: "Productos");

            migrationBuilder.DropIndex(
                name: "IX_Productos_SubcategoriaId",
                table: "Productos");

            migrationBuilder.DropColumn(
                name: "SubcategoriaId",
                table: "Productos");

            migrationBuilder.AlterColumn<bool>(
                name: "Escaparte",
                table: "Productos",
                type: "bit",
                nullable: true,
                oldClrType: typeof(bool),
                oldType: "bit");

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
    }
}
