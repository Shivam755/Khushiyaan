using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Google.Cloud.Firestore;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;

namespace Khushiyaan
{
    public class Basiclayout : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterAsyncTask(new PageAsyncTask(FillData));
        }

        public async Task FillData()
        {
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            FirestoreDb db = FirestoreDb.Create("khushiyaan-48310");
            DocumentSnapshot reg = await db.Collection("Contact Us Info").Document("Registered address").GetSnapshotAsync();
            HtmlControl regAddr = Master.FindControl("RegAddr") as HtmlControl;
            regAddr.Attributes.Add("text", reg.GetValue<String>("Registered address"));
            
        }
    }
}
