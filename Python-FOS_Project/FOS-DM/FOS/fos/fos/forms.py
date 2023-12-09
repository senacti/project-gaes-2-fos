from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from domicilios.models import Domicile

class CustomUserCreationForm(UserCreationForm):
    # Agrega campos personalizados que no están en el modelo User
    phone = forms.CharField(max_length=15)  # Ejemplo de campo personalizado

    class Meta:
        model = User
        fields = ['username', 'first_name', 'email', 'password1', 'password2']  # Corregir los nombres de los campos de contraseña

    def save(self, commit=True):
        user = super(CustomUserCreationForm, self).save(commit=False)
        user.phone = self.cleaned_data['phone']  # Asignar el valor del campo personalizado
        if commit:
            user.save()
            return user
        

#Domicilios
class DomicileForm(forms.ModelForm):
    class Meta:
        model = Domicile
        fields = ['date', 'direction', 'city', 'cod_status_domicile', 'sale']
#///Domicilios