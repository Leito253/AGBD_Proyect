using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mangas.Core
{
    public interface IAdo
    {
        // Usuario
        void AltaUsuario(Usuario usuario);
        IEnumerable<Usuario> ObtenerUsuarios();

        // Manga
        void AltaManga(Manga manga);
        IEnumerable<Manga> ObtenerMangas();

        // Empleado
        void AltaEmpleado(Empleado empleado);
        IEnumerable<Empleado> ObtenerEmpleados();

        // Sucursal
        void AltaSucursal(Sucursal sucursal);
        IEnumerable<Sucursal> ObtenerSucursales();

        // Compra
        void AltaCompra(Compra compra);
        IEnumerable<Compra> ObtenerCompras();

        // Devolución
        void AltaDevolucion(Devolucion devolucion);
        IEnumerable<Devolucion> ObtenerDevoluciones();

        // Calificación 
        void AltaCalificacion(Calificacion calificacion);
        IEnumerable<Calificacion> ObtenerCalificaciones();

        // Stock
        void AltaStock(Stock stock);
        IEnumerable<Stock> ObtenerStock();

        // Relación Sucursal - Empleado 
        void AltaSucursalEmpleado(SucursalEmpleado sucursalEmpleado);
        IEnumerable<SucursalEmpleado> ObtenerSucursalesEmpleados();

        // Envío
        void AltaEnvio(Envio envio);
        IEnumerable<Envio> ObtenerEnvios();
    }
}