using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;


namespace Khushiyaan
{
    [FirestoreData]
    public class Project
    {
        [FirestoreProperty]
        public string name { get; set; }

        [FirestoreProperty]
        public string desc { get; set; }

        [FirestoreProperty]
        public string date { get; set; }
    }
}