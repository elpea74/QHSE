//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QHSE.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Question
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Question()
        {
            this.QuestionAnswers = new HashSet<QuestionAnswer>();
            this.QuestionOptions = new HashSet<QuestionOption>();
        }
    
        public int QuestionId { get; set; }
        public int QuizId { get; set; }
        public Nullable<int> OrderInQuiz { get; set; }
        public string Description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuestionAnswer> QuestionAnswers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuestionOption> QuestionOptions { get; set; }
        public virtual Quiz Quiz { get; set; }
    }
}
