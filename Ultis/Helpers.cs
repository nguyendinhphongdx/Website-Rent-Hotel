using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using static System.Net.Mime.MediaTypeNames;

namespace WebNCASP.Ultis
{
    public static class Helpers
    {
        public static bool SingleUploadFile(HttpPostedFile uploadedFile)
        {
            string fn = System.IO.Path.GetFileName(uploadedFile.FileName);
            string SaveLocation = System.Web.HttpContext.Current.Server.MapPath("/Content/upload") + "\\" + fn;
            try
            {
                uploadedFile.SaveAs(SaveLocation);
                return true;
            }
            catch (Exception ex)
            {
                return false;     
            }
        }
        public static bool MultiUploadFile(IList<HttpPostedFile> listFile)
        {
           for(var i = 0; i < listFile.Count; i++)
            {
                SingleUploadFile(listFile[i]);
            }
            return true;
        }
        public static string GetDateRangeStringDefault()
        {
            return DateTime.Now.ToString("MM/dd/yyyy") +"-"+ DateTime.Now.AddDays(1).ToString("MM/dd/yyyy");
        }
        public static string GetPeopleStringDefault(int room, int parent, int child)
        {
            return room+" phòng,"+parent+" người lớn,"+child+" trẻ em";
        }
    }
}