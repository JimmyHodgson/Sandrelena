//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SandrelenaWebApplication.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RegistrosDeActividades
    {
        public int id_registros_actividades { get; set; }
        public Nullable<int> id_actividad { get; set; }
        public Nullable<int> id_usuario { get; set; }
    
        public virtual Actividades Actividades { get; set; }
        public virtual Usuarios Usuarios { get; set; }
    }
}
