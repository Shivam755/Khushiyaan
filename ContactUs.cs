using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.Cloud.Firestore;


namespace Khushiyaan
{
    [FirestoreData]
    public partial class ContactUs
    {
        [FirestoreProperty]
        public string Value { get; set; }
    }
}