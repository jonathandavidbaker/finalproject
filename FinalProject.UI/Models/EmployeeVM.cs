using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FinalProject.UI.Models
{
    public class EmployeeVM
    {
        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public string Description { get; set; }
        public int ValidFor { get; set; }
        public DateTime DateCompleted { get; set; }
        public int LessonCount { get; set; }

        public DateTime ExpirationDate
        {
            get
            {
                return DateCompleted.AddYears(ValidFor);
            }
        }
    }
}