using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;

using Google.Cloud.Firestore;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Khushiyaan
{
    public partial class View_Messages : System.Web.UI.Page
    {
        FirestoreDb db = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            db = FirestoreDb.Create("khushiyaan-48310");
            RegisterAsyncTask(new PageAsyncTask(getDoc));
        }
        public async Task getDoc()
        {
            //Getting data for table
            IAsyncEnumerator<DocumentReference> responses = db.Collection("Responses ").ListDocumentsAsync().GetAsyncEnumerator();
            int num = 0;
            await foreach (DocumentReference docref in responses)
            {
                DocumentSnapshot docsnap = await docref.GetSnapshotAsync();
                ViewMessages view = docsnap.ConvertTo<ViewMessages>();
                num += 1;

                HtmlGenericControl parent= new("DIV");
                parent.Attributes.Add("ID", "parent" + num);
                parent.Attributes.Add("class", "parentClass");
                Container.Controls.Add(parent);

                HtmlGenericControl res = new("DIV");
                res.Attributes.Add("class", "resClass");
                res.InnerHtml = "Response "+num;

                HtmlGenericControl nameDiv = new("DIV");
                nameDiv.Attributes.Add("class", "nameClass");
                nameDiv.InnerHtml += view.Name;

                HtmlGenericControl messageDiv = new("DIV");
                messageDiv.Attributes.Add("class", "messageClass");
                messageDiv.InnerHtml = view.Message;

                HtmlGenericControl emailDiv = new HtmlGenericControl("DIV");
                emailDiv.Attributes.Add("class", "emailClass");
                emailDiv.InnerHtml = view.Email;
                parent.Controls.Add(res);
                parent.Controls.Add(nameDiv);
                parent.Controls.Add(emailDiv);
                parent.Controls.Add(messageDiv);

                //TABLE

                HtmlTableRow row = new();
                row.Attributes.Add("ID", num.ToString());
                HtmlTableCell col1 = new(), col2 = new(), col3 = new();
                col1.InnerHtml = view.Name;
                col2.InnerHtml = view.Email;
                col3.InnerHtml = view.Message;
                row.Cells.Add(col1);
                row.Cells.Add(col2);
                row.Cells.Add(col3);
                Messages.Rows.Add(row);
            }

        }
    }
}