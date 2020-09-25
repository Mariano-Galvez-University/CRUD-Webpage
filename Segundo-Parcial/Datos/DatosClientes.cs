using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class DatosClientes
    {

        public static DataTable AgregarCliente(EntidadClientes Entidad)
        {
            
            SqlCommand Comando = Conexion.CrearComandoProc("dbo.SPAgregarCliente");
            Comando.Parameters.AddWithValue("@_TxtNit", Entidad.TxtNit);
            Comando.Parameters.AddWithValue("@_TxtNombres", Entidad.TxtNombres);
            Comando.Parameters.AddWithValue("@_TxtApellidos", Entidad.TxtApellidos);
            Comando.Parameters.AddWithValue("@_TxtDireccion", Entidad.TxtDireccion);
            Comando.Parameters.AddWithValue("@_TxtTelefono", Entidad.TxtTelefono);
            Comando.Parameters.AddWithValue("@_TxtEmail", Entidad.TxtEmail);
            Comando.Parameters.AddWithValue("@_TxtSexo", Entidad.TxtSexo);
            Comando.Parameters.AddWithValue("@_EsClienteFrecuente", Entidad.EsClienteFrecuente);

            return Conexion.EjecutarComandoSelect(Comando);
        }

        public static DataTable ObtenerClientes()
        {

            SqlCommand Comando = Conexion.CrearComandoProc("dbo.SPObtenerClientes");

            return Conexion.EjecutarComandoSelect(Comando);
        }

        public static DataTable ObtenerDatosCliente(EntidadClientes Entidad)
        {

            SqlCommand Comando = Conexion.CrearComandoProc("dbo.SPObtenerDatosCliente");
            Comando.Parameters.AddWithValue("@_IdCliente", Entidad.IdCliente);

            return Conexion.EjecutarComandoSelect(Comando);
        }

        public static DataTable EliminarCliente(EntidadClientes Entidad)
        {

            SqlCommand Comando = Conexion.CrearComandoProc("dbo.SPEliminarCliente");
            Comando.Parameters.AddWithValue("@_IdCliente", Entidad.IdCliente);

            return Conexion.EjecutarComandoSelect(Comando);
        }

        public static DataTable ActualizarCliente(EntidadClientes Entidad)
        {

            SqlCommand Comando = Conexion.CrearComandoProc("dbo.SPActualizarCliente");
            Comando.Parameters.AddWithValue("@_IdCliente", Entidad.IdCliente);
            Comando.Parameters.AddWithValue("@_TxtNit", Entidad.TxtNit);
            Comando.Parameters.AddWithValue("@_TxtNombres", Entidad.TxtNombres);
            Comando.Parameters.AddWithValue("@_TxtApellidos", Entidad.TxtApellidos);
            Comando.Parameters.AddWithValue("@_TxtDireccion", Entidad.TxtDireccion);
            Comando.Parameters.AddWithValue("@_TxtTelefono", Entidad.TxtTelefono);
            Comando.Parameters.AddWithValue("@_TxtEmail", Entidad.TxtEmail);
            Comando.Parameters.AddWithValue("@_TxtSexo", Entidad.TxtSexo);
            Comando.Parameters.AddWithValue("@_EsClienteFrecuente", Entidad.EsClienteFrecuente);

            return Conexion.EjecutarComandoSelect(Comando);

         }

    }

  
}
