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
    
    public partial class Usuarios
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuarios()
        {
            this.CarrerasDeUsuarios = new HashSet<CarrerasDeUsuarios>();
            this.GruposDeUsuarios = new HashSet<GruposDeUsuarios>();
            this.Notas = new HashSet<Notas>();
            this.ProfesoresDeAsignaturas = new HashSet<ProfesoresDeAsignaturas>();
            this.RegistrosDeActividades = new HashSet<RegistrosDeActividades>();
        }
    
        public int id_usuario { get; set; }
        public string username { get; set; }
        public string pass { get; set; }
        public string primer_nombre { get; set; }
        public string segundo_nombre { get; set; }
        public string primer_apellido { get; set; }
        public string segundo_apellido { get; set; }
        public System.DateTime fecha_de_nacimiento { get; set; }
        public Nullable<int> id_rol { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CarrerasDeUsuarios> CarrerasDeUsuarios { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GruposDeUsuarios> GruposDeUsuarios { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notas> Notas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProfesoresDeAsignaturas> ProfesoresDeAsignaturas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RegistrosDeActividades> RegistrosDeActividades { get; set; }
        public virtual Roles Roles { get; set; }
    }
}
