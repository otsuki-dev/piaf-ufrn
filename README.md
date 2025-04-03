# PIAF - Portal de Inscrições de Atividades Físicas da COESPE/UFRN

Bem-vindo ao repositório oficial da **PIAF**, o **Portal de Inscrições de Atividades Físicas da UFRN**. Este projeto foi desenvolvido para facilitar a inscrição em atividades físicas oferecidas pela COESPE na UFRN, proporcionando uma experiência simples e eficiente tanto para os usuários quanto para os administradores (bolsistas).

## 📖 Sobre o Projeto

O PIAF é uma plataforma que permite aos usuários:
- Visualizar as modalidades de atividades físicas disponíveis.
- Realizar inscrições de forma rápida e prática.
- Acompanhar suas turmas e resultados.
- Entrar em listas de espera.
- Renovar matrículas.
- Não enfrentar filas grandes.

Além disso, os administradores têm acesso a ferramentas para gerenciar as atividades, como:
- Criar novas turmas.
- Gerenciar inscrições.
- Visualizar relatórios de participação.
- Efetuar chamadas de presença.
- Remover alunos inativos.
- Enviar chamados via e-mail para os candidatos e alunos.
- Ver estatísticas do sistema.

O objetivo principal do PIAF é reduzir a burocracia e otimizar o processo de inscrição, beneficiando tanto os participantes quanto os bolsistas responsáveis pelas atividades. Como consquência, este sistema impacta no meio ambiente, já que as pessoas não terão necessidade de se locomover com seus devidos veículos até a instituição (mesmo sem ter garantia da vaga) e também a redução do consumo de papel e tinta de impressora.

### Impacto no meio ambiente

Aproveitando o gancho da questão ambiental, temos alguns dados aproximados no impacto que será reduzido nos dias das inscrições. Vamos levar em consideração que foram aproximadamente 1000 pessoas realizar as inscrições (se todas que se inscreveram, estiverem presentes), por incrível mil é um número arredondado para baixo do valor real.

Para calcular a emissão de carbono, precisamos considerar alguns fatores:

1. **Automóveis**: A emissão média de dióxido de carbono (CO₂) por quilômetro varia dependendo do tipo de combustível e eficiência do veículo. Para carros a gasolina, estima-se cerca de **120 gramas de CO₂ por quilômetro**. Com 1000 pessoas percorrendo aproximadamente 40 km (soma da ida e volta), a emissão total seria aproximadamente **4,800 kg de CO₂ !**

2. **Ônibus**: Ônibus geralmente emitem menos CO₂ por passageiro, mas como você serão 2 ônibus (ida e volta) e também o círcular para ir e outro para voltar, a emissão total dependerá do tipo de combustível e eficiência. Um ônibus a diesel pode emitir cerca de **1,300 gramas de CO₂ por quilômetro**. Para 4 ônibus percorrendo 40 km, a emissão total seria aproximadamente **208 kg de CO₂**.

Mesmo que todos estivessem de ônibus, ainda teríamos uma quantidade significativa de dióxido de carbono na atmosfera, então, zero é um número bem melhor! Já que ninguém precisará se locomover (exceto idosos que não souberem usar o sistema, mas mesmo assim é um número muito menor).

## 🚀 Funcionalidades

### Para Usuários
1. **Cadastro e Login**:
   - Criação de conta com informações básicas.
   - Login seguro com autenticação.

2. **Inscrição em Atividades**:
   - Visualização de todas as modalidades disponíveis.
   - Inscrição rápida com apenas um clique.

3. **Minhas Turmas**:
   - Acompanhamento das turmas em que o usuário está inscrito.
   - Informações detalhadas sobre horários, vagas e status.

4. **Resultados**:
   - Acesso aos resultados das atividades realizadas.

---

### Para Administradores
1. **Painel de Controle**:
   - Acesso a um dashboard com informações gerais sobre as atividades.

2. **Gerenciamento de Turmas**:
   - Criação, edição e exclusão de turmas.
   - Controle de vagas e participantes.

3. **Relatórios**:
   - Visualização de relatórios detalhados sobre inscrições e participação.

## 🛠️ Tecnologias Utilizadas

- **Ruby on Rails**: Framework principal para o desenvolvimento do backend.
- **PostgreSQL**: Banco de dados utilizado para armazenar informações de usuários, turmas e inscrições.
- **Bootstrap**: Framework CSS para estilização e responsividade.
- **JavaScript**: Para funcionalidades dinâmicas, como filtros e interações.
- **Font Awesome**: Ícones utilizados na interface do usuário.


## 📂 Estrutura do Projeto

### Diretórios Principais
- **`app/`**: Contém os arquivos principais da aplicação, como controllers, models e views.
- **`app/views/pages/`**: Contém as páginas principais, como a página inicial e FAQ.
- **`app/views/shared/`**: Contém componentes reutilizáveis, como a barra lateral e cabeçalho.
- **`config/`**: Configurações da aplicação, incluindo rotas.
- **`db/`**: Arquivos relacionados ao banco de dados, como migrações e seeds.

## ⚙️ Configuração do Ambiente

### Pré-requisitos para funcionar
1. **Ruby**: 3.2 ou superior.
2. **Rails**: 8.0.1.
3. **PostgreSQL**: Instalado e configurado.
4. **Node.js e Yarn**: Para processamento de JavaScript e CSS.
5. **Ferramentas adicionais**: Brakeman, Rubocop, etc.

### Passos para Configuração inicial
1. Clone o repositório e acesse a pasta:
   ```bash
   git clone https://github.com/otsuki-dev/piaf-ufrn
   cd piaf-ufrn
   ```

2. Instale as dependências:
   ```bash
   bundle install
   yarn install
   ```

3. Configure o banco de dados:
   ```bash
   rails db:create db:migrate db:seed
   ```

4. Inicie o servidor:
   ```bash
   rails server
   ```

5. Acesse a aplicação no navegador:
   ```
   http://localhost:3000
   ```

## 🖼️ Estrutura de Interface

### Página Inicial (home)
- Apresenta informações sobre o portal e as modalidades disponíveis.

### FAQ (Perguntas frequentes)
- Responde às perguntas mais frequentes sobre o funcionamento do portal.

### Painel do Usuário (página com login)
- Permite que o usuário visualize suas turmas e resultados.

### Painel do Administrador (página dos bolsistas)
- Oferece ferramentas para gerenciar turmas e visualizar relatórios.


## 📋 Contribuição

Contribuições são muito bem-vindas! Siga os passos abaixo para contribuir:
1. Faça um fork do repositório.
2. Crie uma branch para sua feature:
   ```bash
   git checkout -b minha-feature
   ```
3. Faça as alterações e commit:
   ```bash
   git commit -m "Exemplo de commit de um contibuidor B)"
   ```
4. Envie um pull request.

## 🛡️ Licença

Este projeto está licenciado sob a MIT License. Vocẽ pode contribuir e modificar ao seu critério, porém não se esqueça dos crétitos de licença, deu muito trabalho! ;)

## 📞 Contato

Para dúvidas ou sugestões, entre em contato com o @felipe-sbm:
- **Email**: felipesbm@icloud.com
- **GitHub**: [felipe-sbm](https://github.com/felipe-sbm)