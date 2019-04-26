﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.DATA;
using Microsoft.AspNet.Identity;
using System.Web.Security;
using System.Net.Mail;
using Microsoft.AspNet.Identity.Owin;
using IdentitySample.Models;

namespace FinalProject.UI.Controllers
{
    public class LessonsController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Course);
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }

            string userid = User.Identity.GetUserId();
            if (User.IsInRole("Employee"))
            {
                LessonView newLessonView = new LessonView();
                newLessonView.DateViewed = DateTime.Now;
                newLessonView.UserID = User.Identity.GetUserId();
                newLessonView.LessonID = (int)id;

                db.LessonViews.Add(newLessonView);

                int lessonViewCounter = 0;
                List<Lesson> allLessons = db.Lessons.Where(x => x.CourseID == lesson.CourseID).ToList();
                foreach (var item in allLessons)
                {
                    foreach (var lessonView in db.LessonViews)
                    {
                        if (lessonView.UserID == User.Identity.GetUserId() && lessonView.LessonID == item.LessonID)
                        {
                            lessonViewCounter++;
                            //foreach (var cc in db.CourseCompletions.Where(c=>c.UserID == lessonView.UserID && c.CourseID == item.CourseID))
                            //{
                            //    if (cc.DateCompleted.AddYears(item.Course.ValidFor) <= DateTime.Now.AddMonths(1))
                            //    {
                            //        if (lessonViewCounter == allLessons.Count)
                            //        {
                            //            CourseCompletion newCourseCompletion = new CourseCompletion();
                            //            newCourseCompletion.UserID = User.Identity.GetUserId();
                            //            newCourseCompletion.CourseID = item.CourseID;
                            //            newCourseCompletion.DateCompleted = DateTime.Now;

                            //            db.CourseCompletions.Add(newCourseCompletion);
                            //        }
                            //    }
                            //}

                            if ((lessonViewCounter == allLessons.Count) && (db.CourseCompletions.Where(cc=>cc.UserID == lessonView.UserID && cc.CourseID == item.CourseID).Count() == 0))
                            {
                                CourseCompletion newCourseCompletion = new CourseCompletion();
                                newCourseCompletion.UserID = User.Identity.GetUserId();
                                newCourseCompletion.CourseID = item.CourseID;
                                newCourseCompletion.DateCompleted = DateTime.Now;

                                db.CourseCompletions.Add(newCourseCompletion);

                                Employee e = db.Employees.Find(newCourseCompletion.UserID);
                                
                                var UserManager = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
                                var user = UserManager.FindById(e.ManagerID);

                                string body = $"{e.FirstName} {e.LastName} has completed the course {item.Course.CourseName} as of {newCourseCompletion.DateCompleted:MM/dd/yyyy}.";

                                MailMessage msg = new MailMessage("no-reply@jdbaker.net",
                                                                  //"jon.david.baker@gmail.com",
                                                                  user.Email,
                                                                  "Email from Agency - " + e.FirstName + " " + e.LastName + " completed a course.",
                                                                  body);                                 
                                
                                SmtpClient client = new SmtpClient("mail.jdbaker.net");
                                client.Credentials = new NetworkCredential("no-reply@jdbaker.net", "pr$aM*Y*38V");
                                
                                using (client)
                                {
                                    client.Send(msg);
                                }
                            }
                        }
                    }
                }
                db.SaveChanges();
            }

            return View(lesson);
        }

        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase pdfFile)
        {
            if (ModelState.IsValid)
            {
                //Allowing File Uploads
                string pdfName = "Not Available";

                if (pdfFile != null)
                {
                    pdfName = pdfFile.FileName;
                    string ext = pdfName.Substring(pdfName.LastIndexOf('.')).ToLower();
                    if (ext == ".pdf")
                    {
                        pdfFile.SaveAs(Server.MapPath("~/Content/Files/" + pdfName));
                    }
                }
                lesson.PdfFileName = pdfName;

                //Stripping relevant information from YouTube URL
                if (lesson.VideoURL != null)
                {
                    var v = lesson.VideoURL.IndexOf("v=");
                    var amp = lesson.VideoURL.IndexOf("&", v);
                    string vid;
                    if (amp == -1)
                    {
                        vid = lesson.VideoURL.Substring(v + 2);
                    }
                    else
                    {
                        vid = lesson.VideoURL.Substring(v + 2, amp - (v + 2));
                    }
                    lesson.VideoURL = vid;
                }

                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase pdfFile)
        {
            if (ModelState.IsValid)
            {
                //Allowing File Uploads
                string pdfName = "Not Available";

                if (pdfFile != null)
                {
                    pdfName = pdfFile.FileName;
                    string ext = pdfName.Substring(pdfName.LastIndexOf('.')).ToLower();
                    if (ext == ".pdf")
                    {
                        pdfFile.SaveAs(Server.MapPath("~/Content/Files/" + pdfName));
                    }
                }
                lesson.PdfFileName = pdfName;

                //Stripping relevant information from YouTube URL
                if (lesson.VideoURL != null && lesson.VideoURL.Contains("v="))
                {
                    var v = lesson.VideoURL.IndexOf("v=");
                    var amp = lesson.VideoURL.IndexOf("&", v);
                    string vid;
                    if (amp == -1)
                    {
                        vid = lesson.VideoURL.Substring(v + 2);
                    }
                    else
                    {
                        vid = lesson.VideoURL.Substring(v + 2, amp - (v + 2));
                    }
                    lesson.VideoURL = vid;
                }
                
                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);
            db.Lessons.Remove(lesson);
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
