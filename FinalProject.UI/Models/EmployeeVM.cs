using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FinalProject.UI.Models
{
    public class EmployeeVM
    {
        [Key]
        public string UserID { get; set; }

        [Display(Name = "Course")]
        public string CourseName { get; set; }

        public string Description { get; set; }

        public int ValidFor { get; set; }

        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        [Display(Name = "Date Completed")]
        public DateTime DateCompleted { get; set; }

        [Display(Name = "Lessons")]
        public int LessonCount { get; set; }

        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        [Display(Name = "Expiration Date")]
        public DateTime ExpirationDate
        {
            get { return DateCompleted.AddYears(ValidFor); }
        }
    }
}