from django import forms


class UploadForm(forms.Form):
    sunburst_xml = forms.FileField()
