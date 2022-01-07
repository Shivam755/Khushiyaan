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
            if (IsPostBack)
            {
                LoadViewState(SaveViewState());
            }
            else
            {
                RegisterAsyncTask(new PageAsyncTask(ShowDocsAsync));
            }

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
                DocumentSnapshot docsnap = await docref.GetSnapshotAsync();
                ContactUs view = docsnap.ConvertTo<ContactUs>();
                address.InnerHtml = view.RegisteredAddress;
                email.InnerHtml = view.Email;
                contactno.InnerHtml = view.ContactNo;
                
            }
        }
    }
}