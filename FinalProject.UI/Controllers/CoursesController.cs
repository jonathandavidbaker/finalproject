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
            return View(db.Courses);
        }

        public ActionResult CompletedCourses()
        {
            List<EmployeeVM> empCourses = new List<EmployeeVM>();
            string id = User.Identity.GetUserId();
            foreach (var course in db.CourseCompletions.Where(cc=>cc.UserID == id).Include(c => c.Course))
            {
                EmployeeVM evm = new EmployeeVM();
                evm.UserID = id;
                evm.CourseName = course.Course.CourseName;
                evm.Description = course.Course.Description;
                evm.ValidFor = course.Course.ValidFor;
                evm.LessonCount = db.Lessons.Where(x => x.CourseID == course.CourseID).Count();
                evm.DateCompleted = course.DateCompleted;
                empCourses.Add(evm);
            }
            return View(empCourses);
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

            List<Lesson> courseLessons = db.Lessons.Where(c => c.CourseID == id).ToList();

            ViewBag.CourseName = course.CourseName;
            ViewBag.CourseDescription = course.Description;
            ViewBag.ValidFor = course.ValidFor;

            return View(courseLessons);
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
