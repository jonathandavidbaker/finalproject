using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.DATA;
using Microsoft.AspNet.Identity;
using FinalProject.UI.Models;
using System.Web.Security;
using IdentitySample.Models;
using System.Dynamic;
using Microsoft.AspNet.Identity.Owin;

namespace FinalProject.UI.Controllers
{    
    public class EmployeesController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: Employees
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Index()
        {
            if (User.IsInRole("Manager"))
            {
                List<ManagerVM> emps = new List<ManagerVM>();
                string mgrID = User.Identity.GetUserId();
                foreach (var employee in db.Employees.Where(e => e.ManagerID == mgrID))
                {
                    int expSoon = 0;

                    ManagerVM mvm = new ManagerVM();
                    mvm.UserID = employee.UserID;
                    mvm.EmployeeName = employee.FirstName + " " + employee.LastName;
                    foreach (var cc in db.CourseCompletions.Where(u => u.UserID == employee.UserID).Include(c => c.Course))
                    {
                        if (cc.DateCompleted.AddYears(cc.Course.ValidFor) <= DateTime.Now.AddMonths(1))
                        {
                            expSoon++;
                        }
                    }
                    mvm.ExpCourses = expSoon;
                    int incCount = 0;
                    foreach (var course in db.Courses.Where(c=>c.IsActive))
                    {
                        if (db.CourseCompletions.Where(u => u.UserID == employee.UserID && u.CourseID == course.CourseID).Count() == 0)
                        {
                            incCount++;
                        }
                    }
                    mvm.IncCourses = incCount;
                    emps.Add(mvm);
                    TempData["employees"] = emps;
                }
                return RedirectToAction("ManagerEmployeeView");
            }
            var employees = db.Employees.Include(e => e.Employee1);
            return View(employees.ToList());
        }

        [Authorize(Roles = "Manager")]
        public ActionResult ManagerEmployeeView()
        {
            var employees = TempData["employees"];
            return View(employees);
        }

        [Authorize(Roles = "Employee")]
        public ActionResult EmployeeProgress()
        {
            var id = User.Identity.GetUserId();
            List<EmployeeVM> completeCourses = new List<EmployeeVM>();

            foreach (var course in db.CourseCompletions.Where(cc => cc.UserID == id && cc.Course.IsActive).Include(c => c.Course))
            {
                EmployeeVM evm = new EmployeeVM();
                evm.UserID = id;
                evm.CourseName = course.Course.CourseName;
                evm.Description = course.Course.Description;
                evm.ValidFor = course.Course.ValidFor;
                evm.LessonCount = db.Lessons.Where(x => x.CourseID == course.CourseID && x.IsActive).Count();
                evm.DateCompleted = course.DateCompleted;
                completeCourses.Add(evm);
            }

            List<IncompleteCourseVM> incompleteCourses = new List<IncompleteCourseVM>();

            foreach (var course in db.Courses.Where(c => c.IsActive))
            {
                if (db.CourseCompletions.Where(c => c.UserID == id && c.CourseID == course.CourseID).Count() == 0)
                {
                    IncompleteCourseVM icvm = new IncompleteCourseVM();
                    icvm.CourseID = course.CourseID;
                    icvm.CourseName = course.CourseName;
                    icvm.TotalLessons = db.Lessons.Where(c => c.CourseID == course.CourseID && c.IsActive).Count();
                    icvm.LessonsComplete = db.LessonViews.Where(u => u.UserID == id && u.Lesson.CourseID == course.CourseID).Count();
                    incompleteCourses.Add(icvm);
                }
            }

            dynamic empCourses = new ExpandoObject();
            empCourses.Incomplete = incompleteCourses;
            empCourses.Complete = completeCourses;

            return View(empCourses);
        }

        // GET: Employees/Details/5
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            List<EmployeeVM> completeCourses = new List<EmployeeVM>();

            foreach (var course in db.CourseCompletions.Where(cc => cc.UserID == id).Include(c => c.Course))
            {
                EmployeeVM evm = new EmployeeVM();
                evm.UserID = id;
                evm.CourseName = course.Course.CourseName;
                evm.Description = course.Course.Description;
                evm.ValidFor = course.Course.ValidFor;
                evm.LessonCount = db.Lessons.Where(x => x.CourseID == course.CourseID).Count();
                evm.DateCompleted = course.DateCompleted;
                completeCourses.Add(evm);
            }

            List<IncompleteCourseVM> incompleteCourses = new List<IncompleteCourseVM>();

            foreach (var course in db.Courses.Where(c => c.IsActive))
            {
                if (db.CourseCompletions.Where(c => c.UserID == id && c.CourseID == course.CourseID).Count() == 0)
                {
                    IncompleteCourseVM icvm = new IncompleteCourseVM();
                    icvm.CourseID = course.CourseID;
                    icvm.CourseName = course.CourseName;
                    icvm.TotalLessons = db.Lessons.Where(c => c.CourseID == course.CourseID && c.IsActive && c.Course.IsActive).Count();
                    icvm.LessonsComplete = db.LessonViews.Where(u => u.UserID == id && u.Lesson.CourseID == course.CourseID).Count();
                    incompleteCourses.Add(icvm);
                }
            }
            dynamic empCourses = new ExpandoObject();
            empCourses.Complete = completeCourses;
            empCourses.Incomplete = incompleteCourses;
            ViewBag.Name = employee.FirstName + " " + employee.LastName;
            var UserManager = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = UserManager.FindById(employee.UserID);
            ViewBag.Email = user.Email;

            return View(empCourses);
        }

        // GET: Employees/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManagerID = new SelectList(db.Employees, "UserID", "FirstName", employee.ManagerID);
            return View(employee);
        }

        // POST: Employees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "UserID,FirstName,LastName,ManagerID")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManagerID = new SelectList(db.Employees, "UserID", "FirstName", employee.ManagerID);
            return View(employee);
        }

        // GET: Employees/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // POST: Employees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(string id)
        {
            Employee employee = db.Employees.Find(id);
            db.Employees.Remove(employee);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
