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
    
    public partial class DiaDisponibilidades
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DiaDisponibilidades()
        {
            this.Horarios = new HashSet<Horarios>();
        }
    
        public int id_diaDisponibilidad { get; set; }
        public string dia { get; set; }
        public System.TimeSpan start_time { get; set; }
        public System.TimeSpan end_time { get; set; }
        public bool isActive { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Horarios> Horarios { get; set; }
    }
}
