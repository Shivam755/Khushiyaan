using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Cloud.Firestore;
using System.Threading.Tasks;

namespace Khushiyaan
{
    public partial class AddMember : System.Web.UI.Page
    {
        FirestoreDb db;
        IAsyncEnumerator<Google.Cloud.Firestore.DocumentReference> types = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                RegisterAsyncTask(new PageAsyncTask(AddTypes));
            }
        }

        public async Task AddTypes()
        {
            //Creating connection
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            db = FirestoreDb.Create("khushiyaan-48310");

            //Getting data
            types = db.Collection("Member Types").ListDocumentsAsync().GetAsyncEnumerator();

            DocumentSnapshot temp;
            await foreach (DocumentReference doc in types)
            {
                temp = await doc.GetSnapshotAsync();
                typeSel.Items.Add(new ListItem(temp.GetValue<String>("Name")));
            }
        }

        protected async void add_Click(object sender, EventArgs e)
        {
            //Getting data
            db = FirestoreDb.Create("khushiyaan-48310");
            types = db.Collection("Member Types").ListDocumentsAsync().GetAsyncEnumerator();
            DocumentSnapshot temp;
            DocumentReference curType = null;
            await foreach (DocumentReference doc in types)
            {
                temp = await doc.GetSnapshotAsync();
                if (temp.GetValue<String>("Name").Equals(typeSel.Value))
                {
                    curType = doc;
                    break;
                }
            }
            Team obj = new() { 
                name = Name.Value,
                type = curType
            };
            DocumentReference newMem =  await db.Collection("Team").AddAsync(obj);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Record Saved Sucessfully');", true);
            Response.Redirect("~/Manage_Team.aspx");
        }
    }
}