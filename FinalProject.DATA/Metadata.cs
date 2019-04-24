using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject.DATA
{
    public class CourseMetadata
    {
        //public int CourseID { get; set; }

        [Display(Name = "Course")]
        [Required(ErrorMessage = "* Required")]
        [StringLength(200, ErrorMessage = "* 200 Characters or fewer")]
        public string CourseName { get; set; }

        [StringLength(500, ErrorMessage = "* 500 Characters or fewer")]
        public string Description { get; set; }

        [Display(Name = "Active?")]
        [Required(ErrorMessage = "* Required")]
        public bool IsActive { get; set; }

        [Display(Name = "Years Valid")]
        [Required(ErrorMessage = "* Required")]
        public int ValidFor { get; set; }
    }

    [MetadataType(typeof(CourseMetadata))]
    public partial class Course { }

    public class CourseCompletionMetadata
    {
        //public int CourseCompletionID { get; set; }

        [Display(Name = "User ID")]
        [Required(ErrorMessage = "* Required")]
        public string UserID { get; set; }

        [Display(Name = "Course ID")]
        [Required(ErrorMessage = "* Required")]
        public int CourseID { get; set; }

        [Display(Name = "Date Completed")]
        [Required(ErrorMessage = "* Required")]
        public System.DateTime DateCompleted { get; set; }
    }

    [MetadataType(typeof(CourseCompletionMetadata))]
    public partial class CourseCompletion { }

    public class EmployeeMetadata
    {
        //public string UserID { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "First Name")]
        [StringLength(50, ErrorMessage = "* 50 Characters or fewer")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "* Required")]
        [StringLength(50, ErrorMessage = "* 50 Characters or fewer")]
        public string LastName { get; set; }

        [Display(Name = "Manager")]
        public string ManagerID { get; set; }
    }

    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee { }

    public class LessonMetadata
    {
        //public int LessonID { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Lesson")]
        [StringLength(200, ErrorMessage = "* 200 Characters or fewer")]
        public string LessonTitle { get; set; }

        [Display(Name = "Course")]
        [Required(ErrorMessage = "* Required")]
        public int CourseID { get; set; }

        [StringLength(300, ErrorMessage = "* 300 Characters or fewer")]
        public string Introduction { get; set; }

        [StringLength(250, ErrorMessage = "* 250 Characters or fewer")]
        [Display(Name = "Full YouTube URL")]
        public string VideoURL { get; set; }

        [StringLength(100, ErrorMessage = "* 100 Characters or fewer")]
        public string PdfFileName { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Active?")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(LessonMetadata))]
    public partial class Lesson { }

    public class LessonViewMetadata
    {
        //public int LessonViewID { get; set; }

        [Required(ErrorMessage = "* Required")]
        public string UserID { get; set; }

        [Required(ErrorMessage = "* Required")]
        public int LessonID { get; set; }

        [Required(ErrorMessage = "* Required")]
        public System.DateTime DateViewed { get; set; }
    }

    [MetadataType(typeof(LessonViewMetadata))]
    public partial class LessonView { }
}
