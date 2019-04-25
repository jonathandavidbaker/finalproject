using FinalProject.DATA;
using Microsoft.AspNet.Identity;
using System.Web.Mvc;

namespace IdentitySample.Controllers
{
    public class HomeController : Controller
    {
        FinalProjectEntities db = new FinalProjectEntities();
        
        [HttpGet]
        public ActionResult Index()
        {
            //var user = db.Employees.Find(User.Identity.GetUserId());
            //ViewBag.UserName = user.FirstName;
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
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
