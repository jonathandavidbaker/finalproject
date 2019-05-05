using FinalProject.DATA;
using FinalProject.UI.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace IdentitySample.Controllers
{
    public class HomeController : Controller
    {
        FinalProjectEntities db = new FinalProjectEntities();
        
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel contact)
        {            
            string body = $"Name: {contact.FirstName} {contact.LastName}<br>Email: {contact.Email}<br>Subject: {contact.Subject}<br>Message:<br>{contact.Message}";
            
            MailMessage msg = new MailMessage("no-reply@jdbaker.net",
                                              "jon.david.baker@gmail.com",
                                              "Email from Agency.com - " + contact.Subject,
                                              body);
            msg.IsBodyHtml = true;
                        
            SmtpClient client = new SmtpClient("mail.jdbaker.net");
            client.Credentials = new NetworkCredential("no-reply@jdbaker.net", "EMAIL PASSWORD HERE");
            
            using (client) 
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        client.Send(msg);
                    }
                    else
                    {
                        return View(contact);
                    }
                }
                catch (Exception)
                {
                    ViewBag.ErrorMessage = "There was an error sending your message.  Please try again.";
                    return View(contact);
                }
            }
            
            return View("ContactConfirmation", contact);
        }
    }
}
