using System;
using System.Collections.Generic;

namespace SistemaCadenaAlimenticia.Data.EF
{
    public partial class Cadena
    {
        public Cadena()
        {
            Sucursals = new HashSet<Sucursal>();
        }

        public int IdCadena { get; set; }
        public string RazonSocial { get; set; } = null!;

        public virtual ICollection<Sucursal> Sucursals { get; set; }
    }
}
