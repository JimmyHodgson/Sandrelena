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
    
    public partial class Semestres
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Semestres()
        {
            this.Asignaturas = new HashSet<Asignaturas>();
        }
    
        public int id_semestre { get; set; }
        public int no_semestre { get; set; }
        public Nullable<int> id_carrera { get; set; }
        public bool isActive { get; set; }
    
        public virtual Carreras Carreras { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Asignaturas> Asignaturas { get; set; }
    }
}