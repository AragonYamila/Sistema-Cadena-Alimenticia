using System;
using System.Collections.Generic;

namespace SistemaCadenaAlimenticia.Data.EF
{
    public partial class Sucursal
    {
        public int IdSucursal { get; set; }
        public string? Direccion { get; set; }
        public string? Ciudad { get; set; }
        public int IdCadena { get; set; }

        public virtual Cadena IdCadenaNavigation { get; set; } = null!;
    }
}
