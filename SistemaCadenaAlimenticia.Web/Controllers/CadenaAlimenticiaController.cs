using Microsoft.AspNetCore.Mvc;
using SistemaCadenaAlimenticia.Data.EF;
using SistemaCadenaAlimenticia.Servicios;

namespace SistemaCadenaAlimenticia.Web.Controllers
{
    public class CadenaAlimenticiaController : Controller
    {
        private readonly ICadenaAlimenticiaServicio _servicio;
        public CadenaAlimenticiaController(ICadenaAlimenticiaServicio servicio) {
        
            _servicio = servicio;
        }
        public IActionResult Index()
        {
           ViewBag.Sucursales = _servicio.GetSucursals();
            return View();
        }
        public IActionResult Sucursales(int IdCadena)
        {
            ViewBag.Cadenas = _servicio.GetCadenas();
            if (IdCadena  < 0)
            {
                return Redirect("/CadenaAlimenticia/Sucursales");
            }
            var sucursalesFiltradas=  _servicio.FiltrarSucursales(IdCadena);
            return View(sucursalesFiltradas);
        }
        [HttpGet]
        public IActionResult AltaSucursal()
        {
            var cadenas = _servicio.GetCadenas();
            return View(cadenas);
        }
        [HttpPost]
        public IActionResult AltaSucursal(Sucursal sucursal)
        {
            if (sucursal != null)
             _servicio.AltaSucursal(sucursal);
            TempData["Exito"] = "Se ha registrado exitosamente";
            return Redirect("/CadenaAlimenticia/Index");

        }

    }
}
