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
    
    public partial class Notas
    {
        public int id_nota { get; set; }
        public Nullable<int> id_asignatura { get; set; }
        public Nullable<int> id_usuario { get; set; }
        public int nota { get; set; }
        public bool isActive { get; set; }
    
        public virtual Asignaturas Asignaturas { get; set; }
        public virtual Usuarios Usuarios { get; set; }
    }
}