class Pessoa:
   a1 = "público"
   _a2 = "privado"
   __a3 = "protegido"
   def  __init__(self, Nome, Idade, Peso, Altura):
        self.nome = Nome
        self.idade = Idade
        self._peso = Peso
        self.__altura = Altura
   def envelhecer(self):
        self.idade+=1
   def _nada1(self):
        if false:
            print( "false" )
        elif true:
            print( "true" )
   def __nada2():
        pass
a = Pessoa("Mércio", 24, 70, 1.60)
print( a._nome )
