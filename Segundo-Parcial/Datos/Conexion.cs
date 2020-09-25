using System;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class Conexion
    {
        private static string Usuario = "sa";
        private static string Password = "admin123";
        private static string Servidor = "FURLAN-LAPTOP\\SQLEXPRESS";
        private static string BD = "BDSegundoParcial";

        public static string CadenaConexionSQL()
        {
            return "Persist Security Info = False; User ID = '" + Usuario
                      + "'; Password = '" + Password
                      + "'; Initial Catalog = '" + BD
                      + "'; Server = '" + Servidor + "'";
        }

        //EJECUTAR PROCEDIMIENTO ALMACENADO PASANDOLO COMO PARAMETRO
        public static SqlCommand CrearComandoProc(string SP)
        {
            string CadenaConexion = Conexion.CadenaConexionSQL();
            SqlConnection MiConexion = new SqlConnection(CadenaConexion);
            SqlCommand Comando = new SqlCommand(SP, MiConexion);
            Comando.CommandType = CommandType.StoredProcedure;
            return Comando;
        }

        /*
         EjecutarComandoSelect
         */
        public static DataTable EjecutarComandoSelect(SqlCommand Comando)
        {
            DataTable DT = new DataTable();
            try
            {
                Comando.Connection.Open();
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador.SelectCommand = Comando;
                adaptador.Fill(DT);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Comando.Connection.Dispose();
                Comando.Connection.Close();
            }

            return DT;

        }

    }
}
