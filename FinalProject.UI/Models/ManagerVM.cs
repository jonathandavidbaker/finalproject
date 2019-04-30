using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FinalProject.UI.Models
{
    public class ManagerVM
    {
        [Key]
        public string UserID { get; set; }

        [Display(Name = "Employee")]
        public string EmployeeName { get; set; }

        [Display(Name = "Number of Incomplete Courses")]
        public int IncCourses { get; set; }

        [Display(Name = "Expired or Expiring Soon")]
        public int ExpCourses { get; set; }
    }
}