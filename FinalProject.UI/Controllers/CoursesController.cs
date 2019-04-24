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

namespace FinalProject.UI.Controllers
{
    public class CoursesController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: Courses
        public ActionResult Index()
        {
            if (User.IsInRole("Employee"))
            {
                //List<EmployeeVM> empCourses = new List<EmployeeVM>();
                //string id = User.Identity.GetUserId();
                //foreach (var course in db.Courses)
                //{
                //    EmployeeVM evm = new EmployeeVM();
                //    evm.CourseID = course.CourseID;
                //    evm.CourseName = course.CourseName;
                //    evm.Description = course.Description;
                //    evm.ValidFor = course.ValidFor;
                //    evm.LessonCount = db.Lessons.Where(x => x.CourseID == course.CourseID).Count();
                //    List<CourseCompletion> cc = db.CourseCompletions.Where(x => x.CourseID == course.CourseID).ToList();
                //    foreach (var item in cc)
                //    {
                //        if (item.UserID == id)
                //        {
                //            evm.DateCompleted = item.DateCompleted;
                //        }

                //    }
                //    empCourses.Add(evm);
                //}
                IEnumerable<EmployeeVM> empCourses = (from c in db.Courses
                                                      join cc in db.CourseCompletions on c.CourseID equals cc.CourseID
                                                      join l in db.Lessons on c.CourseID equals l.CourseID
                                                      select new EmployeeVM
                                                      {
                                                          CourseID = c.CourseID,
                                                          CourseName = c.CourseName,
                                                          Description = c.Description,
                                                          ValidFor = c.ValidFor,
                                                          LessonCount = db.Lessons.Where(x => x.CourseID == c.CourseID).Count(),
                                                          DateCompleted = cc.DateCompleted
                                                      }).ToList();

                return RedirectToAction("EmpIndex", empCourses);

            }
            return View(db.Courses);
        }

        public ActionResult EmpIndex(IEnumerable<EmployeeVM> empCourses)
        {
            return View(empCourses);
        }

        public ActionResult CompletedCourses()
        {
            List<Course> courseslist = new List<Course>();

            foreach (var item in db.CourseCompletions)
            {
                if (item.UserID == User.Identity.GetUserId())
                {
                    courseslist.Add(db.Courses.Find(item.CourseID));
                }
            }
            return View(courseslist);
        }

        // GET: Courses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }

            return View(course);
        }

        // GET: Courses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseID,CourseName,Description,IsActive,ValidFor")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Courses.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }

        // GET: Courses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseID,CourseName,Description,IsActive,ValidFor")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }

        // GET: Courses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Course course = db.Courses.Find(id);
            db.Courses.Remove(course);
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
