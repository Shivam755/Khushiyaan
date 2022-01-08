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
            int namenum = 0;
            int descnum = 0;
            int datenum = 0;
            int photonum = 0;
            string assetspath = "../Assets/";
            await foreach (DocumentReference docref in projects)
            {
                DocumentSnapshot docsnap = await docref.GetSnapshotAsync();
                Project proj = docsnap.ConvertTo<Project>();
                namenum += 1;
                descnum += 1;
                datenum += 1;
                photonum += 1;
                HtmlGenericControl nameDiv = new("DIV");
                nameDiv.Attributes.Add("ID", "name" + namenum);
                nameDiv.Attributes.Add("class", "nameClass");
                nameDiv.InnerHtml = proj.Name;
                Container.Controls.Add(nameDiv);


                HtmlGenericControl descDiv = new("DIV");
                descDiv.Attributes.Add("ID", "desc" + descnum);
                descDiv.Attributes.Add("class", "descClass");
                descDiv.InnerHtml = proj.Description;
                Container.Controls.Add(descDiv);

                HtmlGenericControl dateDiv = new("DIV");
                dateDiv.Attributes.Add("ID", "date" + datenum);
                dateDiv.Attributes.Add("class", "dateClass");
                dateDiv.InnerHtml = proj.StartedOn.ToString();
                Container.Controls.Add(dateDiv);

                HtmlImage photoDiv = new();
                photoDiv.Attributes.Add("src",assetspath+proj.Path);
                photoDiv.Attributes.Add("alt", proj.Name);
                photoDiv.Attributes.Add("runat", "server");
                photoDiv.Attributes.Add("class", "photoClass");
                Container.Controls.Add(photoDiv);
                

            }

        }
    }
}