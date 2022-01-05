using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;


namespace Khushiyaan
{
    [FirestoreData]
    public class Team
    {
        [FirestoreProperty]
        public string name { get; set; }

        [FirestoreProperty]
        public DocumentReference type { get; set; }

    }
}