using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using WebNCASP.Models;

namespace WebNCASP
{
    public class Global : HttpApplication
    {
        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown  
        }
        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs  
        }
        void Session_Start(object sender, EventArgs e)
        {
            Session["adMinLogedIn"] = false;
            Session["typeNav"] = "index";
            Session["Cart"] = new List<RoomModel> { };
            Session["HotelSelected"] = null;
            Session["ListRoom"] = new List<RoomModel> { };
            Session["customerCurrent"] = null;
        }
        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends.  
            // Note: The Session_End event is raised only when the sessionstate mode  
            // is set to InProc in the Web.config file. If session mode is set to StateServer  
            // or SQLServer, the event is not raised.  
        }
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}