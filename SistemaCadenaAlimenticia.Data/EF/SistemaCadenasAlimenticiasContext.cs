using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace SistemaCadenaAlimenticia.Data.EF
{
    public partial class SistemaCadenasAlimenticiasContext : DbContext
    {
        public SistemaCadenasAlimenticiasContext()
        {
        }

        public SistemaCadenasAlimenticiasContext(DbContextOptions<SistemaCadenasAlimenticiasContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Cadena> Cadenas { get; set; } = null!;
        public virtual DbSet<Sucursal> Sucursals { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=SistemaCadenasAlimenticias; Trusted_Connection=true;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cadena>(entity =>
            {
                entity.HasKey(e => e.IdCadena)
                    .HasName("PK__Cadena__3A044C97D96E8502");

                entity.ToTable("Cadena");

                entity.Property(e => e.RazonSocial)
                    .HasMaxLength(50)
                    .HasColumnName("Razon_Social");
            });

            modelBuilder.Entity<Sucursal>(entity =>
            {
                entity.HasKey(e => e.IdSucursal)
                    .HasName("PK__Sucursal__BFB6CD9981D1EB11");

                entity.ToTable("Sucursal");

                entity.Property(e => e.Ciudad).HasMaxLength(50);

                entity.Property(e => e.Direccion).HasMaxLength(50);

                entity.HasOne(d => d.IdCadenaNavigation)
                    .WithMany(p => p.Sucursals)
                    .HasForeignKey(d => d.IdCadena)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Sucursal__IdCade__4BAC3F29");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
