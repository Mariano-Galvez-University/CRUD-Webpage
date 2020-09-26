using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Presentacion
{
    public partial class FormularioClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ObtenerClientes();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int VarSesion = Convert.ToInt32(Session["IdCliente"]);
            if (VarSesion != 0)
            {
                ActualizarCliente();

            }
            else
            {
                AgregarCliente();
            }


        }

        protected void btnEditar_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            int IdCliente = Convert.ToInt32(e.CommandArgument);
            Session["IdCliente"] = IdCliente;

            EntidadClientes Entidad = new EntidadClientes();

            Entidad.IdCliente = IdCliente;

            DataTable DT = new DataTable();

            DT = DatosClientes.ObtenerDatosCliente(Entidad);

            TxtNit.Text = DT.Rows[0][0].ToString();
            TxtNombres.Text = DT.Rows[0][1].ToString();
            TxtApellidos.Text = DT.Rows[0][2].ToString();
            TxtDireccion.Text = DT.Rows[0][3].ToString();
            TxtTelefono.Text = DT.Rows[0][4].ToString();
            TxtEmail.Text = DT.Rows[0][5].ToString();
            SelectSexo.SelectedIndex = SelectSexo.Items.IndexOf(SelectSexo.Items.FindByValue(DT.Rows[0][6].ToString()));
            SelectFrecuente.SelectedIndex = SelectFrecuente.Items.IndexOf(SelectFrecuente.Items.FindByValue(DT.Rows[0][7].ToString()));
        }

        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {
            int IdCliente = Convert.ToInt32(e.CommandArgument);

            EntidadClientes Entidad = new EntidadClientes();

            Entidad.IdCliente = IdCliente;

            DataTable DT = new DataTable();
            
            DT = DatosClientes.EliminarCliente(Entidad);

            int Resultado = Convert.ToInt32(DT.Rows[0][0].ToString());


            if (Resultado > 0)
            {
                AlertaExito.CssClass = AlertaExito.CssClass.Replace("d-none", " ");
                MensajeExito.InnerText = "El cliente se ha eliminado con exito.";
                LimpiarFormulario();
                ObtenerClientes();
            }
            else
            {
                AlertaError.CssClass = AlertaError.CssClass.Replace("d-none", " ");
                MensajeError.InnerText = "Error al eliminar cliente.";
            }
        }

        private void ObtenerClientes()
        {
            DataTable DT = new DataTable();
            DT = DatosClientes.ObtenerClientes();

            RepeaterClientes.DataSource = DT;
            RepeaterClientes.DataBind();

            DT.Dispose();
        }

        protected void LimpiarFormulario()
        {
            TxtNit.Text = "";
            TxtNombres.Text = "";
            TxtApellidos.Text = "";
            TxtDireccion.Text = "";
            TxtTelefono.Text = "";
            TxtEmail.Text = "";
            SelectSexo.ClearSelection();
            SelectFrecuente.ClearSelection();
            Session["IdCliente"] = 0;
        }

        private void AgregarCliente()
        {
            EntidadClientes Entidad = new EntidadClientes();

            Entidad.TxtNit = TxtNit.Text;
            Entidad.TxtNombres = TxtNombres.Text;
            Entidad.TxtApellidos = TxtApellidos.Text;
            Entidad.TxtDireccion = TxtDireccion.Text;
            Entidad.TxtTelefono = TxtTelefono.Text;
            Entidad.TxtEmail = TxtEmail.Text;
            Entidad.TxtSexo = Convert.ToChar(SelectSexo.SelectedItem.Value);
            Entidad.EsClienteFrecuente = Convert.ToInt32(SelectFrecuente.SelectedItem.Value);

            DataTable DT = new DataTable();

            DT = DatosClientes.AgregarCliente(Entidad);

            int Resultado = Convert.ToInt32(DT.Rows[0][0].ToString());


            if (Resultado > 0)
            {
                AlertaExito.CssClass = AlertaExito.CssClass.Replace("d-none", " ");
                MensajeExito.InnerText = "El cliente se ha agregado exitosamente!";
                LimpiarFormulario();
                ObtenerClientes();

            }
            else
            {
                AlertaError.CssClass = AlertaError.CssClass.Replace("d-none", " ");
                MensajeError.InnerText = "Error al agregar cliente.";
            }
        }

        private void ActualizarCliente()
        {
            EntidadClientes Entidad = new EntidadClientes();

            Entidad.IdCliente = Convert.ToInt32(Session["IdCliente"]);
            Entidad.TxtNit = TxtNit.Text;
            Entidad.TxtNombres = TxtNombres.Text;
            Entidad.TxtApellidos = TxtApellidos.Text;
            Entidad.TxtDireccion = TxtDireccion.Text;
            Entidad.TxtTelefono = TxtTelefono.Text;
            Entidad.TxtEmail = TxtEmail.Text;
            Entidad.TxtSexo = Convert.ToChar(SelectSexo.SelectedItem.Value);
            Entidad.EsClienteFrecuente = Convert.ToInt32(SelectFrecuente.SelectedItem.Value);

            DataTable DT = new DataTable();

            DT = DatosClientes.ActualizarCliente(Entidad);

            int Resultado = Convert.ToInt32(DT.Rows[0][0].ToString());


            if (Resultado > 0)
            {
                AlertaExito.CssClass = AlertaExito.CssClass.Replace("d-none", " ");
                MensajeExito.InnerText = "El cliente se ha modificado exitosamente.";
                LimpiarFormulario();
                ObtenerClientes();
            }
            else
            {
                AlertaError.CssClass = AlertaError.CssClass.Replace("d-none", " ");
                MensajeError.InnerText = "Error al modificar el cliente.";
            }
        }
    }
}