using System;
using Google.Cloud.Firestore;
using System.Text;
using System.Security.Cryptography;
using System.Web.SessionState; 

namespace Khushiyaan
{
	public partial class Admin_login : System.Web.UI.Page
	{
        FirestoreDb db=null;
		protected void Page_Load(object sender, EventArgs e)
		{
            Session.Abandon();
            //Creating connection
            String path = AppDomain.CurrentDomain.BaseDirectory + @"khushiyaan-48310-firebase-adminsdk-n6h2h-92ec6e587c.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);
            db = FirestoreDb.Create("khushiyaan-48310");
        }

        protected async void submit_Click(object sender, EventArgs e)
        {
            //Getting data
            db = FirestoreDb.Create("khushiyaan-48310");
            DocumentSnapshot pass = await db.Collection("Admin").Document("Password").GetSnapshotAsync();
            String userPass = ComputeSha256Hash(password.Value);
            if (userPass.Equals(pass.GetValue<String>("Value"))){
                //Session.Add("id", Session.SessionID);
                Response.Write("<script>alert('Login Successfull!!!');sessionStorage.setItem('session','started');window.location = 'Admin_home.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Wrong Password!!!');</script>");
            }

        }

        static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}