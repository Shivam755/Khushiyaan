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
    public partial class ContactUs : System.Web.UI.Page
    {
        FirestoreDb db;

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterAsyncTask(new PageAsyncTask(ShowDocsAsync));

        }

        public async Task ShowDocsAsync()
        {
            //Creating connection
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            db = FirestoreDb.Create("khushiyaan-48310");

            //Getting data for types dropdown 

            IAsyncEnumerator<DocumentReference> contact = db.Collection("Contact Us Info").ListDocumentsAsync().GetAsyncEnumerator();
            await foreach (DocumentReference docref in contact)
            {
                if (docref.Id.Equals("Social") || docref.Id.Equals("HeadOffice"))
                    continue;
                DocumentSnapshot docsnap = await docref.GetSnapshotAsync();
                ContactUs view = docsnap.ConvertTo<ContactUs>();
                switch (docref.Id)
                {
                    case "ContactNo":
                        ContactNo.InnerText = view.Value;
                        break;
                    case "Email":
                        Email.InnerText = view.Value;
                        break;
                    case "RegisteredAddress":
                        RegisteredAddress.InnerText = view.Value;
                        break;
                    default:
                        break;

                }
            }
        }
    }
}