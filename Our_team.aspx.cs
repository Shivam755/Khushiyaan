using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Google.Cloud.Firestore;
using System.Threading.Tasks;

namespace Khushiyaan
{
    public partial class Our_team : System.Web.UI.Page
    {
        FirestoreDb db;
        IAsyncEnumerator<DocumentReference> types = null;
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
            
            //Getting data for table
            IAsyncEnumerator<DocumentReference> projects = db.Collection("Team").ListDocumentsAsync().GetAsyncEnumerator();
            DocumentSnapshot temp;
            await foreach (DocumentReference doc in projects)
            {
                temp = await doc.GetSnapshotAsync();
                DocumentSnapshot type = await temp.GetValue<DocumentReference>("Type").GetSnapshotAsync();

                HtmlGenericControl li = new("li");
                li.InnerText += temp.GetValue<String>("Name");
                switch (type.GetValue<String>("Name"))
                {
                    case "Advisory":
                        Advisory.Controls.Add(li);
                        break;
                    case "Core Team":
                        Core_Team.Controls.Add(li);
                        break;
                    case "Trustee":
                        Trustee.Controls.Add(li);
                        break;
                }
            }
        }
    }
}