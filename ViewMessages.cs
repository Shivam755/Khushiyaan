using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;


namespace Khushiyaan
{
    [FirestoreData]
    public class ViewMessages
    {
        [FirestoreProperty]
        public string name { get; set; }

        [FirestoreProperty]
        public string message { get; set; }

        [FirestoreProperty]
        public string email { get; set; }

        public int phone { get; set; }
    }
}