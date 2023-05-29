Name     : Aniket Borawake
Div      :A
Roll No. :26
Title    : mongoDB
------------------------------------------------------------------------------------------------------------------------------------------


> use Sanjivani;
switched to db Sanjivani

> db.marks.insert({sid:123,sname:"aniket",sdept:{dept_no:02,dept_name:"comp"},subject:["c","math","ads","oop"],email:"aniket@1234gmail.com"});
WriteResult({ "nInserted" : 1 })
> db.marks.insert({sid:124,sname:"yashraj",sdept:{dept_no:03,dept_name:"ENTC"},subject:["c","math","ads","electronics"],email:"yashraj@1234gmail.com"});
WriteResult({ "nInserted" : 1 })
> db.marks.insert({sid:125,sname:"rushi",sdept:{dept_no:04,dept_name:"CIVIL"},subject:["SOM","math","ads","TOM"],email:"rushi@14gmail.com"});
WriteResult({ "nInserted" : 1 })
> db.marks.find().pretty();
{
	"_id" : ObjectId("64537c6665afd8d8db3b295c"),
	"sid" : 123,
	"sname" : "aniket",
	"sdept" : {
		"dept_no" : 2,
		"dept_name" : "comp"
	},
	"subject" : [
		"c",
		"math",
		"ads",
		"oop"
	],
	"email" : "aniket@1234gmail.com",
	"shight" : 5,
	"sweight" : 55
}
{
	"_id" : ObjectId("6453807965afd8d8db3b295d"),
	"shight" : 7,
	"sweight" : 65
}
{
	"_id" : ObjectId("6453882165afd8d8db3b295e"),
	"sid" : 124,
	"sname" : "yashraj",
	"sdept" : {
		"dept_no" : 3,
		"dept_name" : "ENTC"
	},
	"subject" : [
		"c",
		"math",
		"ads",
		"electronics"
	],
	"email" : "yashraj@1234gmail.com"
}
{
	"_id" : ObjectId("6453886e65afd8d8db3b295f"),
	"sid" : 125,
	"sname" : "rushi",
	"sdept" : {
		"dept_no" : 4,
		"dept_name" : "CIVIL"
	},
	"subject" : [
		"SOM",
		"math",
		"ads",
		"TOM"
	],
	"email" : "rushi@14gmail.com"
}
> 

//INSERT//

> db.marks.find({sid:123},{sname:1,subject:1});
{ "_id" : ObjectId("64537c6665afd8d8db3b295c"), "sname" : "aniket", "subject" : [ "c", "math", "ads", "oop" ] }

> db.marks.insert({shight:7,sweight:65});
WriteResult({ "nInserted" : 1 })
> db.marks.find().pretty();
{
	"_id" : ObjectId("64537c6665afd8d8db3b295c"),
	"sid" : 123,
	"sname" : "aniket",
	"sdept" : {
		"dept_no" : 2,
		"dept_name" : "comp"
	},
	"subject" : [
		"c",
		"math",
		"ads",
		"oop"
	],
	"email" : "aniket@1234gmail.com"
}
{
	"_id" : ObjectId("6453807965afd8d8db3b295d"),
	"shight" : 7,
	"sweight" : 65
}

//UPDATE//
> db.marks.update({sid:123},{$set:{"shight":5,"sweight":55 }});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.marks.find().pretty();
{
	"_id" : ObjectId("64537c6665afd8d8db3b295c"),
	"sid" : 123,
	"sname" : "aniket",
	"sdept" : {
		"dept_no" : 2,
		"dept_name" : "comp"
	},
	"subject" : [
		"c",
		"math",
		"ads",
		"oop"
	],
	"email" : "aniket@1234gmail.com",
	"shight" : 5,
	"sweight" : 55
}
{
	"_id" : ObjectId("6453807965afd8d8db3b295d"),
	"shight" : 7,
	"sweight" : 65
}
> 

//DELETE//

> db.marks.remove({"sid":125});
WriteResult({ "nRemoved" : 1 })
> db.marks.find().pretty();
{
	"_id" : ObjectId("64537c6665afd8d8db3b295c"),
	"sid" : 123,
	"sname" : "aniket",
	"sdept" : {
		"dept_no" : 2,
		"dept_name" : "comp"
	},
	"subject" : [
		"c",
		"math",
		"ads",
		"oop"
	],
	"email" : "aniket@1234gmail.com",
	"shight" : 5,
	"sweight" : 55
}
{
	"_id" : ObjectId("6453807965afd8d8db3b295d"),
	"shight" : 7,
	"sweight" : 65
}
{
	"_id" : ObjectId("6453882165afd8d8db3b295e"),
	"sid" : 124,
	"sname" : "yashraj",
	"sdept" : {
		"dept_no" : 3,
		"dept_name" : "ENTC"
	},
	"subject" : [
		"c",
		"math",
		"ads",
		"electronics"
	],
	"email" : "yashraj@1234gmail.com"
}

