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
            int namenum = 0;
            int messagenum = 0;
            int emailnum = 0;
            await foreach (DocumentReference docref in responses)
            {
                DocumentSnapshot docsnap = await docref.GetSnapshotAsync();
                ViewMessages view = docsnap.ConvertTo<ViewMessages>();
                namenum += 1;
                messagenum += 1;
                emailnum += 1;
                    
                HtmlGenericControl nameDiv = new HtmlGenericControl("DIV");
                nameDiv.Attributes.Add("ID", "name"+namenum);
                nameDiv.Attributes.Add("class", "nameClass");
                nameDiv.InnerHtml = view.Name;
                Container.Controls.Add(nameDiv);


                HtmlGenericControl messageDiv = new HtmlGenericControl("DIV");
                messageDiv.Attributes.Add("ID", "message"+messagenum);
                messageDiv.Attributes.Add("class", "messageClass");
                messageDiv.InnerHtml = view.Message;
                Container.Controls.Add(messageDiv);

                HtmlGenericControl emailDiv = new HtmlGenericControl("DIV");
                emailDiv.Attributes.Add("ID", "email"+emailnum);
                emailDiv.Attributes.Add("class", "emailClass");
                emailDiv.InnerHtml = view.Email;
                Container.Controls.Add(emailDiv);
            }

        }
    }
}