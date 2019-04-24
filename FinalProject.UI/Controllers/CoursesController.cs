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

namespace FinalProject.UI.Controllers
{
    public class CoursesController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: Courses
        public ActionResult Index()
        {
            List<Course> courseslist = new List<Course>();
            if (User.IsInRole("Employee"))
            {
                //foreach (var item in db.CourseCompletions)
                //{

                //    if (item.UserID != User.Identity.GetUserId())
                //    {
                //        courseslist.Add(db.Courses.Find(item.CourseID));
                //    }
                //}


            }
            else
            {
                courseslist = db.Courses.Include(l => l.Lessons).ToList();
            }

            return View(courseslist);
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

            if (User.IsInRole("Employee"))
            {
                int lessoncount = db.Lessons.Where(x => x.CourseID == course.CourseID).Count();//<--number of lessons in the given course
                int lessonviewcount = 0;
                foreach (var lesson in db.Lessons.Where(x => x.CourseID == course.CourseID))
                {
                    foreach (var lessonview in db.LessonViews.Where(x => x.UserID == User.Identity.GetUserId()))
                    {
                        if (lessonview.LessonID == lesson.LessonID)
                        {
                            lessonviewcount++;
                        }
                    }
                }
                if (lessonviewcount == lessoncount)
                {
                    CourseCompletion newCourseCompletion = new CourseCompletion();
                    newCourseCompletion.UserID = User.Identity.GetUserId();
                    newCourseCompletion.CourseID = course.CourseID;
                    newCourseCompletion.DateCompleted = DateTime.Now;

                    db.CourseCompletions.Add(newCourseCompletion);
                    db.SaveChanges();
                }
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
