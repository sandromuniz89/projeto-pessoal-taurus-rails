# 🛍️ Taurus Entretenimento - E-Commerce Ruby on Rails

Uma plataforma completa de e-commerce e gestão de assinaturas desenvolvida em **Ruby on Rails**, com fluxo moderno de carrinho de compras, autenticação de clientes, disparos de e-mails transacionais e integração direta com **Mercado Pago API** para pagamentos instantâneos via **PIX**.

---

## 📸 Demonstração Visual

### 1. Catálogo de Planos & Produtos
Exibição responsiva dos serviços disponíveis com adição dinâmica ao carrinho.
![Catálogo de Produtos](https://i.postimg.cc/qqQmsp92/inicial.png)

### 2. Autenticação & Cadastro de Clientes
Fluxo de criação de contas com validações completas via Devise.
![Tela de Cadastro](https://i.postimg.cc/qM5w4D0w/criar-conta.png)

### 3. E-mail Transacional de Boas-Vindas
Disparo em background via ActionMailer e fila assíncrona com template HTML customizado em Dark Mode.
![E-mail de Boas-Vindas](https://i.postimg.cc/RhqtY9WY/emailboasvindas.png)

### 4. Carrinho de Compras
Gerenciamento de múltiplos itens, cálculo automático de totais e remoção em tempo real.
![Carrinho de Compras](https://i.postimg.cc/c4gYMxy8/carrinho.png)

### 5. Checkout PIX Integrado (Mercado Pago)
Geração instantânea do QR Code dinâmico e chave Copia e Cola com botão de cópia em 1 clique.
![Checkout PIX](https://i.postimg.cc/Dw1XHxz2/pagamento.png)

### 6. Área do Cliente & Histórico de Pedidos
Visualização de dados cadastrais, histórico detalhado de compras e cancelamento de pedidos pendentes pelo próprio usuário.
![Minha Conta](https://i.postimg.cc/zBGHL5FV/painelcliente.png)

---

## 🚀 Funcionalidades

- **Catálogo de Serviços/Produtos:** Listagem de planos, precificação e gerenciamento de estoque/imagens com ActiveStorage.
- **Carrinho de Compras:** Sessão persistente de carrinho com controle de quantidade e subtotais.
- **Autenticação:** Cadastro, login e controle de sessão seguro com a biblioteca `Devise`.
- **Checkout com PIX Dinâmico:** Comunicação REST via API oficial do Mercado Pago com emissão de QR Code em Base64 e chave Copia e Cola.
- **Webhook de Pagamento:** Endpoint configurado para captura automática de status (`approved`, `pending`, `cancelled`).
- **Painel do Cliente:** Gestão de perfil cadastral, consulta de status e cancelamento de pedidos em aberto.
- **E-mails Transacionais:** Configuração SMTP com Action Mailer para onboarding e avisos de status.

---

## 🛠️ Tecnologias Utilizadas

- **Backend:** Ruby on Rails (MVC Architecture)
- **Banco de Dados:** SQLite (Desenvolvimento) / PostgreSQL (Produção)
- **Autenticação:** Devise
- **Pagamentos:** Mercado Pago REST API (PIX)
- **E-mails:** ActionMailer (SMTP / SolidQueue)
- **Frontend:** ERB, Vanilla JavaScript, CSS Moderno (Design Dark/High-Contrast)

---

## ⚙️ Como Rodar o Projeto Localmente

### Pré-requisitos
- Ruby (>= 3.2.x)
- Bundler instalado
- SQLite3

### Instalação

1. Clone o repositório:
```bash
git clone [https://github.com/sandromuniz89/projeto-pessoal-taurus-rails.git](https://github.com/sandromuniz89/projeto-pessoal-taurus-rails.git)
cd projeto-pessoal-taurus-rails