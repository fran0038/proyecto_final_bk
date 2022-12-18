from django.db import models


# Create your models here.
class Usuario(models.Model):
    username= models.CharField(max_length=30)
    password =models.CharField(max_length=30)
    nombre = models.CharField(max_length=50)
    apellidoPaterno= models.CharField(max_length=50)
    apellidoMaterno= models.CharField(max_length=50)
    fechaNacimiento=models.DateField()
    direccion= models.CharField(max_length=30)

class Cliente(models.Model):
    usuario = models.ForeignKey(Usuario,primary_key=True,null=False, on_delete=models.CASCADE)

class Vendedor(models.Model):
    usuario = models.ForeignKey(Usuario,primary_key=True,null=False, on_delete=models.CASCADE)


class Productos(models.Model):
    nombre = models.CharField(max_length=30)
    precio = models.IntegerField()
    stock = models.IntegerField()

class VentasRealizadas(models.Model):
    producto =models.ForeignKey(Productos,primary_key=True,null=False, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    cliente= models.ForeignKey(Cliente,null=False, on_delete=models.CASCADE)
    vendedor= models.ForeignKey(Vendedor,null=False, on_delete=models.CASCADE)