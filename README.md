# PIAF - Portal de Inscrições de Atividades Físicas da UFRN 🏆

## 📌 Sobre o Projeto

O **PIAF (Portal de Inscrições de Atividades Físicas da UFRN)** é um sistema desenvolvido para **facilitar o processo de inscrição de alunos nos programas esportivos da Universidade Federal do Rio Grande do Norte (UFRN)**. Este portal também aprimora a gestão das informações pelos bolsistas de Educação Física, tornando a divulgação de resultados mais ágil e menos burocrática.

O projeto foi desenvolvido por **Felipe Samuel e James Peter**, alunos da **Escola de Ciências & Tecnologia da UFRN**, sob orientação do **Professor João Vital**.

---

## 🎯 Objetivo

O PIAF foi criado para suprir a necessidade de um sistema organizado, intuitivo e acessível para as inscrições esportivas da UFRN. Antes de sua implementação, o processo era realizado manualmente, o que gerava dificuldades para alunos, professores e bolsistas.

Agora, com o PIAF, os futuros alunos podem:

✅ **Inscrever-se** rapidamente em diversas modalidades esportivas.

✅ **Acompanhar seus processos seletivos** de forma clara e transparente.

✅ **Consultar editais e resultados** de seleções passadas.

✅ **Receber notificações e e-mails automáticos**, garantindo que todas as etapas do processo sejam comunicadas corretamente.

Para os bolsistas e administradores, o sistema facilita:

✅ A **gestão de candidatos** de forma organizada e eficiente.

✅ O **envio automático de e-mails** para comunicação com os participantes.

✅ A **divulgação de resultados** sem burocracia.

---

## 🛠️ Tecnologias Utilizadas

O PIAF foi desenvolvido com um **stack moderno**, focado na segurança, eficiência e facilidade de manutenção:

- **Backend**: Ruby on Rails 🟥
- **Frontend**: Bootstrap 🎨 (estilização responsiva e elegante)
- **Banco de Dados**: PostgreSQL 🗄️
- **Autenticação**: Devise 🔒
- **Envio de E-mails**: Action Mailer ✉️
- **Deploy**: Heroku 🚀 (ou servidor interno da UFRN)

---

## 📌 Funcionalidades

### 🔹 Para Alunos

✅ **Inscrições Online** - Inscrição rápida em diferentes modalidades esportivas.

✅ **Consulta de Editais** - Visualização das regras e requisitos de cada processo seletivo.

✅ **Histórico de Inscrições** - Acesso a todas as inscrições realizadas pelo aluno.

✅ **Recebimento de Notificações por E-mail** - Informações sobre inscrições, aprovações e prazos.

✅ **Consulta de Resultados** - Verificação de resultados passados e atuais.

### 🔹 Para Administradores / Bolsistas

✅ **Gestão de Inscrições** - Acompanhamento e administração das inscrições realizadas.

✅ **Divulgação de Editais** - Cadastro e publicação de novos editais esportivos.

✅ **Processamento de Resultados** - Inserção e divulgação automática de resultados.

✅ **Envio Automático de E-mails** - Comunicação eficiente entre alunos e administração.

✅ **Administração de Usuários** - Gerenciamento de permissões e acesso ao sistema.

---

## 📂 Estrutura do Projeto

O repositório do PIAF segue a seguinte estrutura:

```
PIAF/
│── app/
│   ├── assets/
│   ├── components/
│   ├── controllers/
│   ├── helpers/
│   ├── javascript/
│   ├── jobs/
│   ├── mailers/
│   ├── models/
│   ├── views/
│── config/
│── db/
│── public/
│── test/
│── vendor/
│── Gemfile
│── README.md
│── Rakefile
│── config.ru
```

### **Principais Diretórios**
📂 **app/** - Contém a lógica principal do sistema (assets, components, helpers, etc).

📂 **config/** - Arquivos de configuração do Rails e credenciais do sistema.

📂 **db/** - Estrutura do banco de dados e arquivos de migração.

📂 **public/** - Arquivos estáticos e assets do sistema.

📂 **test/** - Testes unitários e de integração.

📂 **vendor/** - Dependências externas.

---

## 🚀 Como Rodar o Projeto

### 1️⃣ Clonar o Repositório
```bash
git clone https://github.com/ufrn/piaf.git
cd piaf
```

### 2️⃣ Instalar Dependências
```bash
bundle install
```

### 3️⃣ Criar e Popular o Banco de Dados
```bash
rails db:create
rails db:migrate
rails db:seed
```

### 4️⃣ Rodar o Servidor
```bash
rails server
```
Acesse o sistema em: **http://localhost:3000**

---

## 📧 Contato

Se tiver dúvidas ou precisar de suporte, entre em contato:

👨‍💻 **Felipe Samuel** - [GitHub](https://github.com/felipe-sbm) | [E-mail](mailto:felipe.sbm@icloud.com)

👨‍💻 **James Peter** - [GitHub](https://github.com/Jmspter)

📚 **Professor Orientador: João Vital** - [E-mail](mailto:jvital.cunha@ect.ufrn.br)

---

> **PIAF - Portal de Inscrições de Atividades Físicas da UFRN** 🏆  
> "Facilitando a vida dos atletas e dos bolsistas da UFRN!"