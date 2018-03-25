from django.http import HttpResponseRedirect
from django.shortcuts import render
from sunburst.forms import UploadForm

# Create your views here.

def index(request):
    context = {}
    return render(request, 'sunburst/index.html', context)


def upload(request):
    print(request.FILES)
    print(request)
    if request.method == 'POST':
        form = UploadForm(request.POST, request.FILES)
        if form.is_valid():
            print(request.FILES['file'])
            # import_xml_file(request.FILES['file'])
            return HttpResponseRedirect('/')
    else:
        form = UploadForm()
    return render(request, 'sunburst/upload.html', {'form': form})
