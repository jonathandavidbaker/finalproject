using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FinalProject.UI.Models
{
    public class IncompleteCourseVM
    {
        [Key]
        public int CourseID { get; set; }

        public string CourseName { get; set; }

        public int TotalLessons { get; set; }

        public int LessonsComplete { get; set; }

        public int LessonsRemaining
        {
            get { return TotalLessons - LessonsComplete; }
        }

        
        public decimal PercentComplete
        {
            get
            {
                return ((decimal)LessonsComplete / (decimal)TotalLessons)*100;
            }
        }
    }
}