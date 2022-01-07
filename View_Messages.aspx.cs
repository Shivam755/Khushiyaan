using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Google.Cloud.Firestore;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Khushiyaan
{
    public partial class View_Messages : System.Web.UI.Page
    {
        FirestoreDb db;
        WebBrowser wb;
        protected void Page_Load(object sender, EventArgs e)
        {
            wb = new();
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            db = FirestoreDb.Create("khushiyaan-48310");
            RegisterAsyncTask(new PageAsyncTask(getDoc));
            wb.Dispose();
        }
        public async Task getDoc()
        {
            Query colref = db.Collection("Responses");
            QuerySnapshot snap = await colref.GetSnapshotAsync();
            int namenum = 0;
            int messagenum = 0;
            int emailnum = 0;
            int phonenum = 0;
            HtmlDocument doc = wb.Document;
            HtmlElement parent = doc.CreateElement("DIV");
            parent.SetAttribute("ID", "parent");
            doc.Body.AppendChild(parent);
            foreach (DocumentSnapshot docsnap in snap)
            {
                ViewMessages view = docsnap.ConvertTo<ViewMessages>();
                if (docsnap.Exists)
                {
                    namenum += 1;
                    messagenum += 1;
                    emailnum += 1;
                    phonenum += 1;
                    HtmlElement nameDiv = doc.CreateElement("DIV");
                    nameDiv.SetAttribute("ID", "name"+namenum);
                    nameDiv.InnerHtml = view.name;
                    parent.AppendChild(nameDiv);

                    HtmlElement messageDiv = doc.CreateElement("DIV");
                    messageDiv.SetAttribute("ID", "message"+messagenum);
                    messageDiv.InnerHtml = view.message;
                    parent.AppendChild(messageDiv);

                    HtmlElement emailDiv = doc.CreateElement("DIV");
                    emailDiv.SetAttribute("ID", "email"+emailnum);
                    emailDiv.InnerHtml = view.email;
                    parent.AppendChild(emailDiv);

                    HtmlElement phoneDiv = doc.CreateElement("DIV");
                    phoneDiv.SetAttribute("ID", "phone"+phonenum);
                    phoneDiv.InnerHtml = view.phone.ToString();
                    parent.AppendChild(phoneDiv);

                }
            }
        }
    }
}