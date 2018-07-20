//: Playground - noun: a place where people can play

import UIKit
//Criar variável
var str = "O Valor de Pi é: "
print(str)

//Criar constante
var pi: Int = Int(3.1415)
print(pi)
print(str, pi)
print(str + String(pi))
print("O Valor de Pi é: \(pi)")

//Treinando Swift
var x = 3
let y = 4
var z = x + y
print(z)

//Criar concatenado
let piWithValue = ("O valor de pi é: ", 3.1415)
print(piWithValue.0, piWithValue.1)

//Criar Tupla
let piWithTupla: (legenda: String, valor: Int) = (legenda: "Imprime o valor de Pi na tupla: ", valor: 123456)
print(piWithTupla.legenda, piWithTupla.valor)

let dadosPessoa: (nome: String, idade: Int, peso: Int, altura: Float) = (nome: "João Felipe", idade: 29, peso: 88, altura: 1.72)
print(dadosPessoa.nome, dadosPessoa.idade, dadosPessoa.peso, dadosPessoa.altura)
print("Nome do Aluno: \(dadosPessoa.nome)")
print("Idade do Aluno: \(dadosPessoa.idade)", "Peso: \(dadosPessoa.peso)", "Altura: \(dadosPessoa.altura)")

//Optionals
var nome: String?
var outroNome: String!
var nome2: Int?
var nome3: Int? = 1234
var nome4: Int? = 4321
var nome5: Int! = 12345678
print(nome)
print(nome2)
print(nome3)
print(nome4!)
print(nome5)

// = Obrigatoriamente, existe uma pessoa, mas nao existe os atributos
let pessoa: (nome: String?, idade: Float?)
//print(pessoa)

// = Nao existe uma pessoa, mas existe um nome ou idade
let pessoa2: (nome: String, idade: Float)?
let newTupla: (frase: String, numero: Float)?

var pessoaEu: (nome: String, idade: Int)?
pessoaEu = (nome: "João Felipe", idade: 29)
print(pessoaEu!.nome, pessoaEu!.idade)

//Criar Arrays
var idades: [Int] = []
idades.append(19)
idades[0]
print("Count: \(idades.count)")

//Criar Arrays Options
var nomes: [String] = []
var nomes2: [String?] = []
var nomes3: [String?]
var nomes4: [String]?

//Criar Vetor de Pessos --> Tuplas . Array de Tuplas
var pessoas: [(nome: String, idade: Int)] = []
pessoas.append((nome: "Joao", idade: 29))
pessoas.append((nome: "Maria", idade: 25))
print(pessoas)

var galera: [(name: String, age: Int)] = []

var dic: [String : Int] = [:]
dic["Breno"] = 21
dic["Ney"] = 29
dic["Joao"] = 19
dic["Breno"] = 22
print(dic)
