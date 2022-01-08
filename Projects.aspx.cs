using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;

using Google.Cloud.Firestore;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using System.IO;

namespace Khushiyaan
{
    public partial class Projects : System.Web.UI.Page
    {
        FirestoreDb db = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            db = FirestoreDb.Create("khushiyaan-48310");
            RegisterAsyncTask(new PageAsyncTask(getProjectDoc));
        }
        public async Task getProjectDoc()
        {
            //Getting data for table
            IAsyncEnumerator<DocumentReference> projects = db.Collection("Project").ListDocumentsAsync().GetAsyncEnumerator();
            int num = 0;
            string assetspath = "../Assets/";
            await foreach (DocumentReference docref in projects)
            {
                DocumentSnapshot docsnap = await docref.GetSnapshotAsync();
                Project proj = docsnap.ConvertTo<Project>();
                num += 1;

                HtmlGenericControl parent = new("DIV");
                parent.Attributes.Add("class", "parentClass");
                parent.Attributes.Add("ID", "parent" + num);
                Container.Controls.Add(parent);

                HtmlImage photoDiv = new();
                photoDiv.Attributes.Add("src", assetspath + proj.Path);
                photoDiv.Attributes.Add("alt", proj.Name);
                photoDiv.Attributes.Add("runat", "server");
                photoDiv.Attributes.Add("class", "photoClass");
                parent.Controls.Add(photoDiv);

                HtmlGenericControl nameDiv = new("DIV");
                nameDiv.Attributes.Add("class", "nameClass");
                nameDiv.InnerHtml = proj.Name;
                parent.Controls.Add(nameDiv);

                HtmlGenericControl descDiv = new("DIV");
                descDiv.Attributes.Add("class", "descClass");
                descDiv.InnerHtml = proj.Description;
                parent.Controls.Add(descDiv);

                HtmlGenericControl dateDiv = new("DIV");
                dateDiv.Attributes.Add("class", "dateClass");
                dateDiv.InnerHtml ="Started On : " + proj.StartedOn;
                parent.Controls.Add(dateDiv);
            }

        }
    }
}