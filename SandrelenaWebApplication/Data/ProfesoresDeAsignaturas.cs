//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProfesoresDeAsignaturas
    {
        public int id_profesores_asignaturas { get; set; }
        public Nullable<int> id_asignatura { get; set; }
        public Nullable<int> id_usuario { get; set; }
    
        public virtual Asignaturas Asignaturas { get; set; }
        public virtual Usuarios Usuarios { get; set; }
    }
}