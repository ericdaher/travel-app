Aluno: Eric Ribeiro Daher
Email: ericdaher2@gmail.com

# TravelApp

Este é um projeto desenvolvido como parte do curso de Ruby on Rails. O objetivo é aplicar os conceitos aprendidos em aula para criar uma aplicação web funcional, bem estruturada e com boas práticas de desenvolvimento.

## 📦 Tecnologias Utilizadas

- [Ruby](https://www.ruby-lang.org/pt/) 3.3.5
- [Ruby on Rails](https://rubyonrails.org/) 8.0.2
- [SQLite](https://www.sqlite.org/)
- [TailwindCSS](https://tailwindcss.com/)

## 🚀 Como rodar o projeto localmente

```bash
# Clone o repositório
git clone https://github.com/ericdaher/travel-app
cd travel-app

# abra o VSCode
# Inicie o projeto dentro do dev container
# Para popular o banco, execute rails db:setup
```

## ✅ Funcionalidades implementadas

- Cadastro e login de usuários com autenticação
- CRUD de locais
- Background job para buscar na API do Google latitude/longitude e exibição de mapa
- ActionCable para alteração em tempo real da nota de um local

## 🧠 Conceitos aplicados

Abaixo estão os conceitos aprendidos em aula e aplicados neste projeto, junto com a justificativa de sua utilização:

### 1. **Service Objects**

Service Objects são utilizados para encapsular lógicas de negócio e evitar que lógica fique acumulada no controller ou no model. Nesse projeto, foi utilizado um Service Object
com o método de classe `.call` para executar a chamada de API para o Google de modo a obter a latitude e a longitude de um local.

### 2. **SolidQueue**

SolidQueue é utilizado para executar tarefas de forma assíncrona, melhorando a usabilidade da aplicação. Nesse projeto a rotina de atualizar a latitude e longitude de um local é 
executada utilizando um `background job` via SolidQueue, já que essa operação não é bloqueante para a criação/edição de um local.

### 3. **Padrão Observer**

O padrão Observer é utilizado para propragar mudanças de um objeto para outros, de forma indireta. Nesse projeto o padrão foi utilizado para permitir que quando um usuário altera a nota de um local, a alteração é refletida em tempo real para outros usuários.

### 4. **Padrão Presenter**

O padrão Presenter é utilizado para criar uma camada intermediária entre a View e o Model, em que normalmente é acrescentado ao Model métodos específicos para a sua exibição na view. Nesse projeto, um Presenter é utilizado para buscar a foto do mapa do local na API do Google.

### 5. **Cache**

O cache interno do Rails possibilita que partes da aplicação não precisem sempre ser executadas. Nesse projeto o cache é utilizado para armazenar a resposta do mapa via API do Google, já que a imagem do mapa de um local nunca muda.

### 6. **Repository**

O padrão Repository consiste em isolar as interações de um modelo com o banco de dados, favorecendo a separação entre a aplicação e o banco. Nesse projeto, os escopos criados para 
o model Location foram transferidos para o LocationRepository.

_Os conceitos foram, obviamente, utilizados de maneira a exemplificar suas aplicações - uma aplicação desse escopo só se prejudica por utilizar coisas como o padrão Repository._
