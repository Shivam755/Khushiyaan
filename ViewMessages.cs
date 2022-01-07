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
        public string Name { get; set; }

        [FirestoreProperty]
        public string Message { get; set; }

        [FirestoreProperty]
        public string Email { get; set; }
    }
}