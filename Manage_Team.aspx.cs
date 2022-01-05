using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
        
        protected void Page_Load(object sender, EventArgs e)
        {

            RegisterAsyncTask(new PageAsyncTask(ShowDocsAsync));
        }

        public async Task ShowDocsAsync()
        {
            //Creating connection
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            FirestoreDb db = FirestoreDb.Create("khushiyaan-48310");

            //Getting data
            IAsyncEnumerator<Google.Cloud.Firestore.DocumentReference> projects = db.Collection("Team").ListDocumentsAsync().GetAsyncEnumerator();

            DocumentSnapshot temp;
            await foreach(DocumentReference doc in projects)
            {
                temp = await doc.GetSnapshotAsync();
                DocumentSnapshot type = await temp.GetValue<DocumentReference>("Type").GetSnapshotAsync();
                //Creating a row
                HtmlTableRow row = new();
                row.Attributes.Add("ID", temp.Id);

                //Creating cells
                HtmlTableCell col1 = new(), col2 = new(),col3=new(), col4=new();
                HtmlLink edit = new();
                edit.Href = "~/";
                col1.Controls.Add(new LiteralControl(temp.GetValue<String>("Name")));
                col2.Controls.Add(new LiteralControl(type.GetValue<String>("Name")));
                col4.Controls.Add(edit);


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
    }
}