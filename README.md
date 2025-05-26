
# 📝 Montreal Tasks 

## ✅ Descrição

Este projeto implementa um **serviço REST** e um **cliente VCL** para gerenciamento de tarefas, utilizando **Delphi** e **SQL Server**.

O serviço (**TaskService**) expõe APIs REST para:
- Criar tarefas
- Listar tarefas
- Atualizar status
- Excluir tarefas
- Consultar estatísticas SQL

O cliente (**VCL**) consome a API e permite interação com as tarefas via **interface gráfica**.

## ✅ Tecnologias Utilizadas

- **Delphi**: Desenvolvimento do serviço e cliente.
- **ZeosLib**: Conexão com SQL Server (`sybdb.dll`).
- **RESTRequest4Delphi**: Consumo de APIs no cliente.
- **SQL Server**: Banco de dados `Montreal`.
- **Horse Framework**: Serviço REST.

## ✅ Requisitos para instalação

### 🔹 Serviço (TaskService)
- Delphi **XE3 ou superior**
- ZeosLib configurado para MSSQL
- `sybdb.dll` na **mesma pasta do .exe**
- SQL Server **instalado** e **executando**

### 🔹 Cliente (VCL)
- Delphi **XE3 ou superior**
- Biblioteca **RESTRequest4Delphi**

## ✅ Instalação do Serviço

1. **Clone ou copie** o projeto.
2. Coloque o arquivo **`sybdb.dll`** na **mesma pasta** do executável (`TasksService.exe`):
   ```
   /MontrealService
      |- TasksService.exe
      |- sybdb.dll
   ```
3. Compile e execute o projeto **TaskService**:
   ```
   http://localhost:9000
   ```

4. O serviço expõe as rotas:
   - `GET /tarefas` → lista todas as tarefas
   - `POST /tarefas` → adiciona tarefa
   - `PUT /tarefas/:id/status` → atualiza status
   - `DELETE /tarefas/:id` → exclui tarefa
   - Estatísticas:
     - `GET /tarefas/total`
     - `GET /tarefas/media-prioridade-pendentes`
     - `GET /tarefas/concluidas-7-dias`

## ✅ Configuração do Banco de Dados

1. Crie o banco de dados:

```sql
CREATE DATABASE Montreal;
GO
```

2. Use o banco:

```sql
USE Montreal;
GO
```

3. Execute o **script SQL gerado** para criar a tabela `Tarefas`:

```sql
CREATE TABLE Tarefas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Descricao NVARCHAR(255) NOT NULL,
    Status NVARCHAR(50) NOT NULL,
    Prioridade INT NOT NULL,
    DataCriacao DATETIME NOT NULL DEFAULT GETDATE(),
    DataConclusao DATETIME NULL
);
```

4. Opcional: adicione dados de exemplo:

```sql
INSERT INTO Tarefas (Descricao, Status, Prioridade) VALUES
('Implementar serviço REST', 'Pendente', 3),
('Desenvolver cliente VCL', 'Pendente', 2),
('Testar integração', 'Concluída', 1);
```

## ✅ Como configurar a conexão com SQL Server

Na unit:

```pascal
Conn.LibraryLocation := ExtractFilePath(ParamStr(0)) + 'sybdb.dll';
Conn.HostName := '127.0.0.1';
Conn.Port := 50172; // ou a porta configurada no SQL Server
Conn.Database := 'Montreal';
```

Usuário e senha podem ser adicionados conforme necessário:

```pascal
Conn.User := 'sa';
Conn.Password := 'sua_senha';
```

## ✅ Instalação do Cliente (VCL)

1. Configure o **RESTRequest4Delphi** no Delphi:
   - Adicione o diretório da lib ao **Library Path**.
   - Opcional: copie os arquivos `.pas` para o projeto.

2. Compile e execute o cliente.

3. O cliente possui:
- **Listagem** de tarefas.
- **Edição** do status.
- **Inserção** de novas tarefas.
- **Exclusão** de tarefas.
- Visualização de **estatísticas**: total, média de prioridade pendentes, concluídas nos últimos 7 dias.

## ✅ Fluxo da aplicação

1. **TaskService** é iniciado:
   ```
   http://localhost:9000
   ```

2. O **cliente VCL** é aberto:
   → Consulta e exibe as tarefas.

3. O usuário:
   - **Adiciona** tarefa → via formulário → API `POST /tarefas`.
   - **Atualiza** status → via formulário → API `PUT /tarefas/:id/status`.
   - **Exclui** tarefa → via botão → API `DELETE /tarefas/:id`.
   - **Consulta** estatísticas → API `GET` correspondente.

## ✅ Testes

Você pode usar o **Postman** para testar as rotas:

```bash
curl --location 'http://localhost:9000/tarefas' --header 'Authorization: montrealtoken'
```

Todas as requisições devem incluir o header:

```
Authorization: montrealtoken
```

## ✅ Observações importantes

- O **Token** de autenticação é fixo: `montrealtoken`.
- O campo `DataConclusao` é **automaticamente preenchido** com a data atual ao marcar status `Concluída`.
- O serviço valida o `Status` → deve ser `Concluída` ou `Pendente`.

## ✅ Possíveis melhorias futuras

- Autenticação com **JWT**.
- Configuração de **CORS**.
- Implementar **log** e **tratamento global de exceções**.

## ✅ Contato

Desenvolvido por **[Diego Ernani]** para o processo seletivo **Montreal**.  
Para dúvidas: [diegoernani@gmail.com]
