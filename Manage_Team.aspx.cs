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
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            FirestoreDb db = FirestoreDb.Create("khushiyaan-48310");
            IAsyncEnumerator<Google.Cloud.Firestore.DocumentReference> projects = db.Collection("Project").ListDocumentsAsync().GetAsyncEnumerator();
            await foreach(DocumentReference doc in projects)
            {
                DIV1.InnerHtml = doc.ToString();
                Console.WriteLine(doc.ToString());
            }
        }
    }
}