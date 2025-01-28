using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MvcSoporte.Models;

namespace MvcSoporte.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<MvcSoporte.Models.Aviso> Aviso { get; set; } = default!;
    }
}
