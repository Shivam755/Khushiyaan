using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Google.Cloud.Firestore;
using System.Threading.Tasks;

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

            RegisterAsyncTask(new PageAsyncTask(getDoc));

        }

        public async Task getDoc()
        {
            Query colref = db.Collection("Project");
            QuerySnapshot snap = await colref.GetSnapshotAsync();
            int namenum = 0;
            int descnum = 0;
            int datenum = 0;
            HtmlGenericControl parent = new("DIV");
            parent.ID = "parent" ;
            this.Controls.Add(parent);
            foreach (DocumentSnapshot docsnap in snap) {
                    Project project = docsnap.ConvertTo<Project>();
                if (docsnap.Exists) {
                    namenum += 1;
                    descnum += 1;
                    datenum += 1;
                    HtmlGenericControl nameDiv = new("DIV");
                    nameDiv.ID = "name" + namenum;
                    nameDiv.InnerHtml += project.name;
                    parent.Controls.Add(nameDiv);
                    
                    HtmlGenericControl dateDiv = new("DIV");
                    dateDiv.ID = "date" + datenum;
                    dateDiv.InnerHtml += project.date;
                    parent.Controls.Add(dateDiv);

                    HtmlGenericControl descDiv = new("DIV");
                    descDiv.ID = "desc"+descnum;
                    descDiv.InnerHtml += project.desc;
                    parent.Controls.Add(descDiv);

                }
            }
        }
    }
}