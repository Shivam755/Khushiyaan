using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Google.Cloud.Firestore;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Khushiyaan
{
    public partial class View_Messages : System.Web.UI.Page
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
            Query colref = db.Collection("Responses");
            QuerySnapshot snap = await colref.GetSnapshotAsync();
            int namenum = 0;
            int messagenum = 0;
            int emailnum = 0;
            int phonenum = 0;
            HtmlGenericControl parent = new("DIV");
            parent.ID = "parent";
            this.Controls.Add(parent);
            foreach (DocumentSnapshot docsnap in snap)
            {
                ViewMessages view = docsnap.ConvertTo<ViewMessages>();
                if (docsnap.Exists)
                {
                    namenum += 1;
                    messagenum += 1;
                    emailnum += 1;
                    phonenum += 1;
                    HtmlGenericControl nameDiv = new("DIV");
                    nameDiv.ID = "name" + namenum;
                    nameDiv.InnerHtml += view.name;
                    parent.Controls.Add(nameDiv);

                    HtmlGenericControl messDiv = new("DIV");
                    messDiv.ID = "date" + messagenum;
                    messDiv.InnerHtml += view.message;
                    parent.Controls.Add(messDiv);

                    HtmlGenericControl emailDiv = new("DIV");
                    emailDiv.ID = "desc" + emailnum;
                    emailDiv.InnerHtml += view.email;
                    parent.Controls.Add(emailDiv);

                    HtmlGenericControl phoneDiv = new("DIV");
                    phoneDiv.ID = "date" + phonenum;
                    phoneDiv.InnerHtml += view.phone;
                    parent.Controls.Add(phoneDiv);
                }
            }
        }
    }
}