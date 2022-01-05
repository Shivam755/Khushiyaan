﻿using System;
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
        public string Name { get; set; }

        [FirestoreProperty]
        public DocumentReference Type { get; set; }

    }
}