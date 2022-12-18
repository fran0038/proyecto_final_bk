from django.shortcuts import render
from api.models import Usuario,Productos
from api.formulario import DatosUsuario, DatosProductos

# Create your views here.
def usuarios(request):
    usuarios = Usuario.objects.all()
    data = {'usuarios': usuarios}
    return render(request,'tablaUsuarios.html',data)


def productos(request):
    productos = Productos.objects.all()
    dato = {'productos': productos}
    return render(request,'tablaProductos.html',dato)

#registrar un usuario------------------------

def registroUsuario(request):
    form =DatosUsuario()

    usuario =Usuario()
    if request.method == 'POST':
        form = DatosUsuario(request.POST)
        print("paso0")
        if form.is_valid():
            print("paso1")
            usuario.username = form['username'].value()
            usuario.password= form['password'].value()
            usuario.nombre = form['nombre'].value()
            usuario.apellidoPaterno = form['apellidoPaterno'].value()
            usuario.apellidoMaterno = form['apellidoMaterno'].value()
            usuario.fechaNacimiento = form['fechaNacimiento'].value()
            usuario.direccion = form['direccion'].value()
            usuario.save()
            print("paso2")
        else:
            print("El formulario no es valido")
    else:
        print("El metodo no es POST")   
    data = {'form':form}
    return render(request, 'usuarios.html', data)

#registrar un producto--------------------

def IngresarProductos(request):
    forms = DatosProductos()
    productos =Productos()
    if request.method == 'POST':
        print("paso1")
        forms = DatosProductos(request.POST)
    
        if forms.is_valid():
            print("paso2")
            productos.nombre = forms['nombre'].value()
            productos.precio = forms['precio'].value()
            productos.stock = forms['stock'].value()
            productos.save()
            print(productos.nombre)

        else:
            print("El formulario no es valido")
    else:
        print("El metodo no es POST")   

    datos = {'forms':forms}
    return render(request, 'productos.html', datos)
        

#modificar un usuario----------------

def actualizarUsuario(request, id):
    usuario =Usuario.objects.get(id = id)
    form = DatosUsuario(instance= usuario)
    if request.method =='POST':
        form = formulario.DatosUsuario(request.POST, instance=usuario)
        print("aqui2")
        if form.is_valid():
            print(form)
            usuario.save()
            print("aqui4")
        return usuarios(request)

    dato = {'form': form}
    return render(request, 'usuarios.html', dato)
    print("pasoooo")

def eliminarUsuario(request, id):
    usuario = Usuario.objects.get(id = id)
    usuario.delete()
    return render(request, 'tablaUsuarios.html')