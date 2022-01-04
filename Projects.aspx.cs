using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
namespace Khushiyaan
{
    public partial class Projects : System.Web.UI.Page
    {
        FirestoreDb db;
        protected void Page_Load(object sender, EventArgs e)
        {
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            db = FirestoreDb.Create("khushiyaan-48310");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        async void getDoc()
        {
            Query colref = db.Collection("Project");
            QuerySnapshot snap = await colref.GetSnapshotAsync();

            foreach (DocumentSnapshot docsnap in snap) {
                Project project = docsnap.ConvertTo<Project>();
            }
        }
    }
}