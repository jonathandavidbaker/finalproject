//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FinalProject.DATA
{
    using System;
    using System.Collections.Generic;
    
    public partial class LessonView
    {
        public int LessonViewID { get; set; }
        public string UserID { get; set; }
        public int LessonID { get; set; }
        public System.DateTime DateViewed { get; set; }
    
        public virtual Lesson Lesson { get; set; }
    }
}
