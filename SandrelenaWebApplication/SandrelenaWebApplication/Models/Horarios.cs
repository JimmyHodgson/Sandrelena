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
    
    public partial class Horarios
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Horarios()
        {
            this.Matrículas = new HashSet<Matrículas>();
        }
    
        public int id_horario { get; set; }
        public Nullable<int> id_aula { get; set; }
        public Nullable<int> id_asignatura { get; set; }
        public int no_grupo { get; set; }
        public Nullable<int> id_diaDisponibilidad { get; set; }
        public bool isActive { get; set; }
    
        public virtual Asignaturas Asignaturas { get; set; }
        public virtual Aulas Aulas { get; set; }
        public virtual DiaDisponibilidades DiaDisponibilidades { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Matrículas> Matrículas { get; set; }
    }
}
