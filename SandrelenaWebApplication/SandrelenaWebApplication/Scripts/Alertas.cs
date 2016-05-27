using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SandrelenaWebApplication.Scripts
{
    public class Alertas
    {

        public enum Tipos
        {
            Error,
            Warning,
            Success
        }

        public static void NuevaAlerta(Control control, Tipos tipo, string mensaje)
        {
            string funcion;
            switch (tipo)
            {
                case Tipos.Error:
                    funcion = "showAlert('#e-alert', 'Error', '" + mensaje + "');";
                    break;
                case Tipos.Warning:
                    funcion = "showAlert('#w-alert', 'Advertencia', '" + mensaje + "');";
                    break;
                case Tipos.Success:
                    funcion = "showAlert('#s-alert', 'Éxito', '" + mensaje + "');";
                    break;
                default:
                    funcion = "showAlert('#w-alert', 'Advertencia', 'Error generando la alerta.');";
                    break;
            }

            ScriptManager.RegisterStartupScript(control, control.GetType(), control.UniqueID, funcion, true);
        }
    }
}