package httpapi.authz 

#This will be a grade example in which only the assigned professor will be able to view certain students grades

#Daisy is Jose's and Moises' professor, meanwhile Shannon is Marlen's professor
subordinates := {"Jose": [], "Moises": [], "Marlen": [], "Daisy": ["Jose", "Moises"],  "Shannon": ["Marlen"]}

default allow := false

allow
{
    input.method == "GET"
    input.path == ["final_grade","grade", input.user]
}

allow
{
    some username
    input.method == "GET"
    input.path = ["final_grade","grade", username]
    subordinates[input.user][_] == username
}
