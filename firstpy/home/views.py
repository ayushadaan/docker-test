from django.shortcuts import render, HttpResponse

# Create your views here.
def index(req):
    # return HttpResponse("Hello World!")
    context={
        "variable":"Hello",
        "variable2":"AwesomeApp"
    }
    return render(req, "index.html",context)

def about(req):
    # return HttpResponse("About Us")
    return render(req,"about.html")

def contact(req):
    # return HttpResponse("Contact Us")
    return render(req,"contact.html")


def services(req):
    # return HttpResponse("Services")
    return render(req,"services.html")