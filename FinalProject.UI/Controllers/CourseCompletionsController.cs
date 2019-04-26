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
using System.Dynamic;

namespace FinalProject.UI.Controllers
{
    public class CourseCompletionsController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: CourseCompletions
        public ActionResult Index()
        {
            var courseCompletions = db.CourseCompletions.Include(c => c.Course);
            return View(courseCompletions.ToList());
        }

        public ActionResult EmployeeProgress()
        {
            var id = User.Identity.GetUserId();
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

            foreach (var course in db.Courses)
            {
                if (db.CourseCompletions.Where(c => c.UserID == id && c.CourseID == course.CourseID).Count() == 0)
                {
                    IncompleteCourseVM icvm = new IncompleteCourseVM();
                    icvm.CourseID = course.CourseID;
                    icvm.CourseName = course.CourseName;
                    icvm.TotalLessons = db.Lessons.Where(c => c.CourseID == course.CourseID).Count();
                    icvm.LessonsComplete = db.LessonViews.Where(u => u.UserID == id && u.Lesson.CourseID == course.CourseID).Count();
                    incompleteCourses.Add(icvm);
                }
            }

            dynamic empCourses = new ExpandoObject();
            empCourses.Incomplete = incompleteCourses;
            empCourses.Complete = completeCourses;

            return View(empCourses);
        }

        // GET: CourseCompletions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            return View(courseCompletion);
        }

        // GET: CourseCompletions/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName");
            return View();
        }

        // POST: CourseCompletions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseCompletionID,UserID,CourseID,DateCompleted")] CourseCompletion courseCompletion)
        {
            if (ModelState.IsValid)
            {
                db.CourseCompletions.Add(courseCompletion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", courseCompletion.CourseID);
            return View(courseCompletion);
        }

        // GET: CourseCompletions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", courseCompletion.CourseID);
            return View(courseCompletion);
        }

        // POST: CourseCompletions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseCompletionID,UserID,CourseID,DateCompleted")] CourseCompletion courseCompletion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(courseCompletion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", courseCompletion.CourseID);
            return View(courseCompletion);
        }

        // GET: CourseCompletions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            return View(courseCompletion);
        }

        // POST: CourseCompletions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            db.CourseCompletions.Remove(courseCompletion);
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
