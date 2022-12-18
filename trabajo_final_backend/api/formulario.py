from django import forms

class DatosUsuario(forms.Form):
    username= forms.CharField()
    password =forms.CharField(widget=forms.PasswordInput())
    nombre = forms.CharField()
    apellidoPaterno= forms.CharField()
    apellidoMaterno= forms.CharField()
    fechaNacimiento=forms.DateField(required=False)
    direccion= forms.CharField()



class DatosProductos(forms.Form):
    nombre =forms.CharField()
    precio = forms.IntegerField()
    stock = forms.IntegerField()