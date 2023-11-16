using SistemaCadenaAlimenticia.Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaCadenaAlimenticia.Servicios
{
    public interface ICadenaAlimenticiaServicio
    {
        List<Sucursal> GetSucursals();
        List<Cadena> GetCadenas();
        List<Sucursal> FiltrarSucursales(int IdCadena);
        void AltaSucursal(Sucursal sucursal);
        Sucursal GetSucursalPorId(int id);

    }
    public class CadenaAlimenticiaServicio :ICadenaAlimenticiaServicio
    {
        private SistemaCadenasAlimenticiasContext _context;
        public CadenaAlimenticiaServicio(SistemaCadenasAlimenticiasContext contexto)
        {
            _context = contexto;
        }
        public List<Sucursal> GetSucursals()
        {
            return _context.Sucursals.ToList();
        }
        public List<Cadena> GetCadenas()
        {
            return _context.Cadenas.ToList();
        }
        public List<Sucursal> FiltrarSucursales(int IdCadena)
        {
            return _context.Sucursals.Where(s => s.IdCadena == IdCadena).OrderBy(s => s.Ciudad).ToList();
        }
        public void AltaSucursal(Sucursal sucursal)
        {
            var sucursalBuscada = _context.Sucursals.Find(sucursal.IdSucursal);
            if(sucursalBuscada == null)
            _context.Sucursals.Add(sucursal);
            _context.SaveChanges();
        }
        public Sucursal GetSucursalPorId(int id)
        {

           return _context.Sucursals.Find(id);

        }
    }
}
