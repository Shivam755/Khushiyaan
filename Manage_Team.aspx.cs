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
    
    static class Extensions
    { 
        public static IAsyncEnumerator<T> GetAsyncEnumerator<T>(this IAsyncEnumerator<T> enumerator) => enumerator;
    }
    public partial class Manage_Team : System.Web.UI.Page
    {
        FirestoreDb db;
        IAsyncEnumerator<Google.Cloud.Firestore.DocumentReference> types = null;
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
            types = db.Collection("Member Types").ListDocumentsAsync().GetAsyncEnumerator();
            DocumentSnapshot temp;
            await foreach (DocumentReference doc in types)
            {
                temp = await doc.GetSnapshotAsync();
                typeSel.Items.Add(new ListItem(temp.GetValue<String>("Name")));
            }

            //Getting data for table
            IAsyncEnumerator<Google.Cloud.Firestore.DocumentReference> projects = db.Collection("Team").ListDocumentsAsync().GetAsyncEnumerator();
            await foreach(DocumentReference doc in projects)
            {
                temp = await doc.GetSnapshotAsync();
                DocumentSnapshot type = await temp.GetValue<DocumentReference>("Type").GetSnapshotAsync();
                //Creating a row
                HtmlTableRow row = new();
                row.Attributes.Add("ID", temp.Id);

                //Creating cells
                HtmlTableCell col1 = new(), col2 = new(),col3=new(), col4=new();
                HtmlInputButton delete = new() { ID= temp.Id, Value="Delete"};
                delete.ServerClick += new EventHandler(this.delete_Click);
                col1.Controls.Add(new LiteralControl(temp.GetValue<String>("Name")));
                col2.Controls.Add(new LiteralControl(type.GetValue<String>("Name")));
                col4.Controls.Add(delete);


                //Adding cells to rows
                row.Cells.Add(col1);
                row.Cells.Add(col2);
                row.Cells.Add(col3);
                row.Cells.Add(col4);

                //Adding row to table
                Members.Rows.Add(row);
                Console.WriteLine(doc.ToString());
            }
        }

        async void delete_Click(object sender, EventArgs e)
        { 
            
            HtmlButton cur = (HtmlButton)sender;
            db = FirestoreDb.Create("khushiyaan-48310");

            DocumentReference del = db.Collection("Team").Document(cur.ID);
            DocumentSnapshot temp = await del.GetSnapshotAsync();
            Team obj = temp.ConvertTo<Team>();
            Name.Value = obj.Name;
            
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Member Deleted Sucessfully');", true);
            //Response.Redirect("~/Manage_Team.aspx");
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
            Team obj = new()
            {
                Name = this.Name.Value,
                Type = curType
            };
            DocumentReference newMem = await db.Collection("Team").AddAsync(obj);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Member Added Sucessfully');", true);
            Response.Redirect("~/Manage_Team.aspx");
        }
    }
}