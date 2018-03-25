from django.http import HttpResponseRedirect
from django.shortcuts import render
from django import forms

# Create your views here.


class UploadFileForm(forms.Form):
    sunburst_xml = forms.FileField()


def index(request):
    context = {}
    return render(request, 'sunburst/index.html', context)


def upload(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            # import_xml_file(request.FILES['file'])
            return HttpResponseRedirect('/')
    else:
        form = UploadFileForm()
    return render(request, 'sunburst/upload.html', {'form': form})
